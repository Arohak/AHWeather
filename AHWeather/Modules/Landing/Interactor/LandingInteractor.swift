//
//  LandingInteractor.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingInteractor: NSObject, LandingInteractorInput {
    
    let cities = ["London", "Moscow", "Yerevan"]
    weak var output: LandingInteractorOutput!
    
    func getWeatherItems() {
        var count = 0
        
        for city in cities {
            _ = apiHelper.rx_GetWeather(city)
                .subscribe(onNext: { data in
                    dbHelper.storeWeather(Weather(data: data))
                    
                    ++count
                    if count == self.cities.count {
                        let items = dbHelper.getStoredWeathers().map({$0})
                        self.output.dataIsReady(items)
                    }
                    
                    }, onError: { e in
//                        let error = e as NSError
//                        UIHelper.showHUD(error.localizedDescription)
                        UIHelper.showHUD("No Internet Connection")
                        let items = dbHelper.getStoredWeathers().map({$0})
                        self.output.dataIsReady(items)
                    })
        }
    }
}


