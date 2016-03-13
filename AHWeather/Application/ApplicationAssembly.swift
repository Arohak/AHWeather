//
//  ApplicationAssembly.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

public class ApplicationAssembly: TyphoonAssembly {

    //Application
    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            $0.injectProperty("rootPresenter", with: self.landingPresenter())
        }
    }

    //Landing
    public dynamic func landingPresenter() -> AnyObject {
        return TyphoonDefinition.withClass(LandingPresenter.self) {
            $0.injectProperty("view", with: self.landingViewController())
            $0.injectProperty("interactor", with: self.landingInteractor())
            $0.injectProperty("router", with: self.landingRouter())
        }
    }
    
    public dynamic func landingViewController() -> AnyObject {
        return TyphoonDefinition.withClass(LandingViewController.self) {
            $0.injectProperty("output", with: self.landingPresenter())
        }
    }
    
    public dynamic func landingInteractor() -> AnyObject {
        return TyphoonDefinition.withClass(LandingInteractor.self) {
            $0.injectProperty("output", with: self.landingPresenter())
        }
    }
    
    public dynamic func landingRouter() -> AnyObject {
        return TyphoonDefinition.withClass(LandingRouter.self)
    }
    
    //Detail
//    public dynamic func detailPresenter() -> AnyObject {
//        return TyphoonDefinition.withClass(DetailPresenter.self) {
//            $0.injectProperty("view", with: self.detailViewController())
//            $0.injectProperty("interactor", with: self.detailInteractor())
//            $0.injectProperty("router", with: self.detailRouter())
//        }
//    }
//    
//    public dynamic func detailViewController() -> AnyObject {
//        return TyphoonDefinition.withClass(DetailViewController.self) {
//            $0.injectProperty("output", with: self.detailPresenter())
//        }
//    }
//    
//    public dynamic func detailInteractor() -> AnyObject {
//        return TyphoonDefinition.withClass(DetailInteractor.self) {
//            $0.injectProperty("output", with: self.detailPresenter())
//        }
//    }
//    
//    public dynamic func detailRouter() -> AnyObject {
//        return TyphoonDefinition.withClass(DetailRouter.self)
//    }
//    
//    //Map
//    public dynamic func mapPresenter() -> AnyObject {
//        return TyphoonDefinition.withClass(MapPresenter.self) {
//            $0.injectProperty("view", with: self.mapViewController())
//            $0.injectProperty("interactor", with: self.mapInteractor())
//            $0.injectProperty("router", with: self.mapRouter())
//        }
//    }
//    
//    public dynamic func mapViewController() -> AnyObject {
//        return TyphoonDefinition.withClass(MapViewController.self) {
//            $0.injectProperty("output", with: self.mapPresenter())
//        }
//    }
//    
//    public dynamic func mapInteractor() -> AnyObject {
//        return TyphoonDefinition.withClass(MapInteractor.self) {
//            $0.injectProperty("output", with: self.mapPresenter())
//        }
//    }
//    
//    public dynamic func mapRouter() -> AnyObject {
//        return TyphoonDefinition.withClass(MapRouter.self)
//    }
}
