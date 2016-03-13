//
//  LandingRouter.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingRouter: NSObject, LandingRouterInput {

    @objc func push(fromVC: UINavigationController, toVC: UIViewController) {
        
        fromVC.pushViewController(toVC, animated: true)
    }
}
