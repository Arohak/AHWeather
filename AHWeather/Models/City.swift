//
//  City.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class City : Object {

    dynamic var name: String!
    dynamic var lon: String!
    dynamic var lat: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.name = data["name"].stringValue
        self.lat = data["lat"].stringValue
        self.lon = data["lon"].stringValue
    }
}
