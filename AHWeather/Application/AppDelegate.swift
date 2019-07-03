//
//  AppDelegate.swift
//  AHWeather
//
//  Created by Ara Hakobyan on 3/2/16.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootPresenter: LandingPresenter!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        startApplication()
        
        return true
    }
    
    private func startApplication() {
        rootPresenter = LandingPresenter()
        _ = LandingModuleInitializer(presentor: rootPresenter)
        let vc = rootPresenter.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: true)
        configureApplication()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    private func configureApplication() {
        UIHelper.configurateApplicationApperance()
        initServices()
    }
    
    private func initServices() {
        //AIzaSyCGy1iTpcWWI7HSNLhndiJCeSn3eP-us48, AIzaSyC0ZOSD0RDLsrraE7iID3jQDSG0j-L35rU
        GMSServices.provideAPIKey("AIzaSyCGy1iTpcWWI7HSNLhndiJCeSn3eP-us48")
    }
}

