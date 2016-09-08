//
//  MapPresenter.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapPresenter: NSObject, MapModuleInput, MapViewOutput, MapInteractorOutput {

    var view: MapViewInput!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!
    var detailPresenter: DetailPresenter!

    var city: City!
    var block: blockUpdate!
    
    //MARK: - Initialize
    init(city: City, completionBlock: blockUpdate) {
        super.init()
        
        self.city = city
        block = completionBlock
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - MapViewOutput
    func viewIsReady() {
        EventCenter.defaultCenter.register(self, handler: onEvent)
//        locationHelper.locationManager.startUpdatingLocation()

        view.setupInitialState(self.city)
    }
    
    func searchAction(city: String) {
        interactor.findCityForMap(city)
    }
    
    func updateAction(city: String) {
        cancelAction()
        block!(city: city)
    }
    
    func cancelAction() {
        EventCenter.defaultCenter.unregister(self)
        
        let vc = appDelegate.window?.rootViewController
        router.dismiss(vc!)
    }
    
    //MARK: - MapInteractorOutput
    func foundCity(city: City?) {
        if let city = city {
            view.setupInitialState(city)
        } else {
            view.shakeTextField()
        }
    }
    
    //MARK: - Events
    func onEvent(data: AHWLocation) {
       view.updateLocation(data.result)
    }
}
