//
//  DetailRouter.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailRouter: DetailRouterInput {

    func pop(navVC: UINavigationController) {
        navVC.popToRootViewController(animated: true)
    }
    
    func present(fromVC: UINavigationController, toVC: UIViewController) {
        toVC.modalPresentationStyle = .overCurrentContext
        toVC.modalTransitionStyle = .crossDissolve
        fromVC.present(toVC, animated: true, completion: nil)
    }
}
