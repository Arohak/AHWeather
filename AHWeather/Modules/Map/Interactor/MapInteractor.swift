//
//  MapInteractor.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapInteractor: MapInteractorInput {

    weak var output: MapInteractorOutput!

    func findCityForMap(city: String) {
        if city.isEmpty {
            self.output.foundCity(nil)
            return
        }
        _ = apiHelper.rx_GeocodeAddress(city)
            .subscribe(onNext: { data in
                let allResults = data["results"].arrayValue
                if !allResults.isEmpty {
                    let result = allResults[0]
                    let gLocation = result["geometry"]["location"]
                    let json = JSON(["name" : city, "lat" : gLocation["lat"].stringValue, "lon" : gLocation["lng"].stringValue])
                    
                    self.output.foundCity(City(data: json))
                } else {
                    self.output.foundCity(nil)
                }
                
                }, onError: { e in
                    UIHelper.showHUD("No Internet Connection")
            })
    }
    
    func createDirections(origin: String, destination: String) {
        _ = apiHelper.rx_GetDirections(origin, destination: destination)
            .subscribe(onNext: { data in
                let routes = data["routes"].arrayValue
                let route = routes[0]["overview_polyline"]["points"].stringValue
                let path: GMSPath = GMSPath(fromEncodedPath: route)!
                _ = GMSPolyline(path: path)
                
                }, onError: { e in
                    UIHelper.showHUD("No Internet Connection")
            })
    }
}
