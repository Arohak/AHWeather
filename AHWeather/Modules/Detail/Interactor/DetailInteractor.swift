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
        _ = apiHelper.rx_GetWeatherForecast(city, days: days)
            .subscribe(onNext: { data in
                if let error = data["error"]["message"].string {
                    UIHelper.showHUD(error)
                    return
                }
                let weatherForecast = WeatherForecast(data: data)
                dbHelper.storeWeatherForecast(weatherForecast)
                let object = dbHelper.getStoredWeatherForecast(weatherForecast.name).map({$0})[0]
                
                self.output.dataIsReady(object)
                
                }, onError: { e in
                    UIHelper.showHUD("No Internet Connection")
                    var object: WeatherForecast?
                    if dbHelper.getStoredWeatherForecast(city).map({$0}).count > 0 {
                        object = dbHelper.getStoredWeatherForecast(city).map({$0})[0]
                    }
                    
                    self.output.dataIsReady(object)
                })
    }
}
