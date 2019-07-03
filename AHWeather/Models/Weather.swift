//
//  Weather.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class Weather : Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: Location!
    @objc dynamic var current: Current!
    
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
    
    @objc dynamic var name: String!
    @objc dynamic var lat: String!
    @objc dynamic var lon: String!
    @objc dynamic var localTime: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.name = data["name"].stringValue
        self.lon = data["lon"].stringValue
        self.lat = data["lat"].stringValue
        self.localTime = data["localtime"].stringValue
    }
}

class Current : Object {
    
    @objc dynamic var lastUpdated: String!
    @objc dynamic var tempC: String!
    @objc dynamic var tempF: String!
    @objc dynamic var mphW: String!
    @objc dynamic var kphW: String!
    @objc dynamic var mbP: String!
    @objc dynamic var inP: String!
    @objc dynamic var feelslikeC: String!
    @objc dynamic var feelslikeF: String!
    @objc dynamic var condition: Condition!
    
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
    
    @objc dynamic var text: String!
    @objc dynamic var icon: String!
    @objc dynamic var code: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.text = data["text"].stringValue
        self.icon = data["icon"].stringValue
        self.code = data["code"].stringValue
    }
}
