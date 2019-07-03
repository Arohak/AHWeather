//
//  LandingPresenter.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingPresenter: NSObject, LandingModuleInput, LandingViewOutput, LandingInteractorOutput {

    var view: LandingViewInput!
    var interactor: LandingInteractorInput!
    var router: LandingRouterInput!
    var detailPresenter: DetailPresenter!
    
    //MARK: - LandingViewOutput
    func viewIsReady() {
        interactor.getWeatherItems()
    }
    
    func viewIsSelectItem(item: Weather) {
        let detailPresenter = DetailPresenter(city: item.name)
        _ = DetailModuleInitializer(presentor: detailPresenter)
        
        let nav = appDelegate.window?.rootViewController as! UINavigationController
        router.push(fromVC: nav, toVC: detailPresenter.view as! UIViewController)
    }
    
    //MARK: - LandingInteractorOutput
    func dataIsReady(items: Array<Weather>) {
        view.setupInitialState(items: items)
    }
}
