//
//  DetailPresenter.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailPresenter: NSObject, DetailModuleInput, DetailViewOutput, DetailInteractorOutput {

    var view: DetailViewInput!
    var interactor: DetailInteractorInput!
    var router: DetailRouterInput!

    var days = "5"
    var cityName: String!
    var city: City!
    
    //MARK: - Initialize
    init(city: String) {
        super.init()
        
        self.cityName = city
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - DetailViewOutput
    func viewIsReady() {
        interactor.getWeatherForecast(city: cityName, days: days)
    }
    
    //MARK: - DetailInteractorOutput
    func dataIsReady(object: WeatherForecast?) {
        if let object = object {
            self.cityName = object.name
            let json = JSON(["name" : cityName, "lat" : object.weather.location.lat, "lon" : object.weather.location.lon])
            self.city = City(data: json)

            view.setupInitialState(object: object)
        }
    }
    
    //MARK: - DetailViewOutput
    func backAction() {
        let nav = appDelegate.window?.rootViewController as! UINavigationController
        router.pop(navVC: nav)
    }
    
    func searchAction() {
        let mapPresenter = MapPresenter(city: city) { cityName in
            if !cityName.isEmpty {
                self.interactor.getWeatherForecast(city: cityName, days: self.days)
            }
        }
        _ = MapModuleInitializer(presentor: mapPresenter)
        
        let nav = appDelegate.window?.rootViewController as! UINavigationController        
        router.present(fromVC: nav, toVC: mapPresenter.view as! UIViewController)
    }
    
    func fiveDayAction() {
        days = "5"
        interactor.getWeatherForecast(city: cityName, days: days)
    }
    
    func tenDayAction() {
        days = "10"
        interactor.getWeatherForecast(city: cityName, days: days)
    }
    
    func updateAction() {
        interactor.getWeatherForecast(city: cityName, days: days)
    }
}
