//
//  DetailRouter.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailRouter: DetailRouterInput {

    func pop(navVC: UINavigationController) {
        navVC.popToRootViewControllerAnimated(true)
    }
    
    func present(fromVC: UINavigationController, toVC: UIViewController) {
        toVC.modalPresentationStyle = .OverCurrentContext
        toVC.modalTransitionStyle = .CrossDissolve
        fromVC.presentViewController(toVC, animated: true, completion: nil)
    }
}
