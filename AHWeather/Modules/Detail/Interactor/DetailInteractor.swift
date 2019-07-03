//
//  DetailInteractor.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailInteractor: DetailInteractorInput {
    
    weak var output: DetailInteractorOutput!
    
    func getWeatherForecast(city: String, days: String) {
        _ = apiHelper.rx_GetWeatherForecast(cityName: city, days: days)
            .subscribe(onNext: { data in
                if let error = data["error"]["message"].string {
                    UIHelper.showHUD(message: error)
                    return
                }
                let weatherForecast = WeatherForecast(data: data)
                dbHelper.storeWeatherForecast(item: weatherForecast)
                let object = dbHelper.getStoredWeatherForecast(city: weatherForecast.name).map({$0})[0]
                
                self.output.dataIsReady(object: object)
                
                }, onError: { e in
                    UIHelper.showHUD(message: "No Internet Connection")
                    var object: WeatherForecast?
                    let results = dbHelper.getStoredWeatherForecast(city: city)
                    if Array(results).map({$0}).count > 0 {
                        object = results.map({$0})[0]
                    }
                    
                    self.output.dataIsReady(object: object)
                })
    }
}
