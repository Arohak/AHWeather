//
//  Extension.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 9/4/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

extension Double {
    
    var round: String {
        let number = Int(self)
        return "\(number)"
    }
    
    var celsius: String {
        return  self.round + "\u{2103}"
    }
    
    var fahrenheit: String {
        return  self.round + "\u{2109}"
    }
    
    var percent: String {
        return  self.round + " %"
    }
}

extension String {
    
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    var shortTime: String {
        if let interval : TimeInterval = TimeInterval(self) {
            let date = Date(timeIntervalSince1970: interval)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            let time = dateFormatter.string(from: date)
            return time
        }
        
        return ""
    }
    
    var weekDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date!)
    }
}
