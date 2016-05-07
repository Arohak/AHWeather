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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        startApplication()
        
        return true
    }
    
    private func startApplication() {        
        let vc = rootPresenter.view as! UIViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: true)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    //MARK: - TyphoonDefinition Inject
    func configureApplication() {
        UIHelper.configurateApplicationApperance()
        initServices()
    }
    
    func initServices() {
        GMSServices.provideAPIKey("AIzaSyC0ZOSD0RDLsrraE7iID3jQDSG0j-L35rU")
    }
}

