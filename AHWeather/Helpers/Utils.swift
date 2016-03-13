//
//  Utils.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Utils {
    
    class func stringFromDateString(dateString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.dateFromString(dateString as String)
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.stringFromDate(date!)
    }
    
    class func getWeekString(dateString: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.dateFromString(dateString as String)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.stringFromDate(date!)
    }
    
    class func formateString(number: String) -> String {
        let formatter = NSNumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.paddingPosition = NSNumberFormatterPadPosition.BeforePrefix
        formatter.paddingCharacter = "0"
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        let num = formatter.numberFromString(number)

        return num == nil ? "" : formatter.stringFromNumber(num!)!
    }
}

