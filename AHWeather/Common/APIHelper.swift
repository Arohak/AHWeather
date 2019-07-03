//
//  APIHelper.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

let apiHelper = APIHelper.sharedInstance

class APIHelper {
    
    static let sharedInstance = APIHelper()
    let manager = SessionManager.default
    
    //MARK: - API Routers
    private struct ROUTERS
    {
        static let GET_WEATHER              = "http://api.apixu.com/v1/current.json?key=6c0d9ec402854c01a6c120751160203&q=%@"
        static let GET_WEATHER_FORECAST     = "http://api.apixu.com/v1/forecast.json?key=6c0d9ec402854c01a6c120751160203&q=%@&days=%@"
        static let GEOCODE_ADDRESS          = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCGy1iTpcWWI7HSNLhndiJCeSn3eP-us48&address=%@"
        static let GET_DIRECTIONS           = "https://maps.googleapis.com/maps/api/directions/json?origin=%@&destination=%@"
//        static let GET_WEATHER = "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=848c6f714deb2219816b686306bc766d"
    }
    
    private func request(method: HTTPMethod,
                    url: String,
                    parameters: [String: Any]? = nil,
                    showProgress: Bool = true)
        -> Observable<JSON>
    {
        return Observable.create { observer in
            if showProgress { UIHelper.showProgressHUD() }
            
            let URL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            Alamofire.request(URL, method: method,
                              parameters: parameters,
                              encoding: URLEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(JSON(data))
                    case .failure(let error):
                        UIHelper.showHUD(message: error.localizedDescription)
                        observer.onError(error)
                    }
                    
                    if showProgress { UIHelper.hideProgressHUD() }
            }
            
            return Disposables.create { }
        }
    }
    
    func rx_GetWeather(cityName: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_WEATHER, cityName)
        return request(method: .get, url: url)
    }
    
    func rx_GetWeatherForecast(cityName: String, days: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_WEATHER_FORECAST, cityName, days)
        return request(method: .get, url: url)
    }
    
    func rx_GeocodeAddress(cityName: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GEOCODE_ADDRESS, cityName)
        return request(method: .get, url: url)
    }
    
    func rx_GetDirections(origin: String, destination: String) -> Observable<JSON> {
        let url = String(format: ROUTERS.GET_DIRECTIONS, origin, destination)
        return request(method: .get, url: url)
    }
}
