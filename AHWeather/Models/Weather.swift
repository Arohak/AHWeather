//
//  Weather.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Weather : Object {
    
    dynamic var name = ""
    dynamic var location: Location!
    dynamic var current: Current!
    
    convenience init(data: JSON) {
        self.init()
        
        self.location = Location(data: data["location"])
        self.current = Current(data: data["current"])
        self.name = location.name
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
}

class Location : Object {
    
    dynamic var name: String!
    dynamic var lat: String!
    dynamic var lon: String!
    dynamic var localTime: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.name = data["name"].stringValue
        self.lon = data["lon"].stringValue
        self.lat = data["lat"].stringValue
        self.localTime = data["localtime"].stringValue
    }
}

class Current : Object {
    
    dynamic var lastUpdated: String!
    dynamic var tempC: String!
    dynamic var tempF: String!
    dynamic var mphW: String!
    dynamic var kphW: String!
    dynamic var mbP: String!
    dynamic var inP: String!
    dynamic var feelslikeC: String!
    dynamic var feelslikeF: String!
    dynamic var condition: Condition!
    
    convenience init(data: JSON) {
        self.init()
        
        self.lastUpdated = data["last_updated"].stringValue.hour
        self.tempC = data["temp_c"].doubleValue.celsius
        self.tempF = data["temp_f"].doubleValue.fahrenheit
        self.mphW = data["wind_mph"].doubleValue.percent
        self.kphW = data["wind_kph"].doubleValue.percent
        self.mbP = data["pressure_mb"].doubleValue.percent
        self.inP = data["pressure_in"].doubleValue.percent
        self.feelslikeC = data["feelslike_c"].doubleValue.celsius
        self.feelslikeF = data["feelslike_f"].doubleValue.fahrenheit
        self.condition = Condition(data: data["condition"])
    }
}

class Condition : Object {
    
    dynamic var text: String!
    dynamic var icon: String!
    dynamic var code: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.text = data["text"].stringValue
        self.icon = data["icon"].stringValue
        self.code = data["code"].stringValue
    }
}
