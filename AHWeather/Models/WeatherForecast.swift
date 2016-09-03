//
//  WeatherForecast.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class WeatherForecast : Object {
    
    dynamic var name = ""
    dynamic var weather: Weather!
    var forecastDays = List<ForecastDay>()
    
    convenience init(data: JSON) {
        self.init()
        
        self.weather = Weather(data: data)
        self.name = weather.name

        for item in data["forecast"]["forecastday"].arrayValue {
            self.forecastDays.append(ForecastDay(data: item))
        }
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
}

class ForecastDay : Object {
    
    dynamic var date: String!
    dynamic var day: Day!
    dynamic var astro: Astro!
    var hours = List<Hour>()
    
    convenience init(data: JSON) {
        self.init()
        
        self.date = data["date"].stringValue
        self.day = Day(data: data["day"])
        self.astro = Astro(data: data["astro"])
        for item in data["hour"].arrayValue { self.hours.append(Hour(data: item)) }
    }
}

class Day : Object {

    dynamic var maxTemp: String!
    dynamic var minTemp: String!
    dynamic var avgTemp: String!
    dynamic var maxWindMph: String!
    dynamic var maxWindKph: String!
    dynamic var condition: Condition!

    convenience init(data: JSON) {
        self.init()
        
        self.maxTemp = data["maxtemp_c"].doubleValue.celsius
        self.minTemp = data["mintemp_c"].doubleValue.celsius
        self.avgTemp = data["avgtemp_c"].doubleValue.celsius
        self.maxWindMph = data["maxwind_mph"].doubleValue.percent
        self.maxWindKph = data["maxwind_kph"].doubleValue.percent
        self.condition = Condition(data: data["condition"])
    }
}

class Astro : Object {
    
    dynamic var sunrise: String!
    dynamic var sunset: String!
    dynamic var moonrise: String!
    dynamic var moonset: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.sunrise = data["sunrise"].stringValue
        self.sunset = data["sunset"].stringValue
        self.moonrise = data["moonrise"].stringValue
        self.moonset = data["moonset"].stringValue
    }
}

class Hour : Object {
    
    dynamic var time: String!
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
        
        self.time = data["time"].stringValue.hour
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
