//
//  DetailRouterInput.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol DetailRouterInput {
    
    func pop(navVC: UINavigationController)
    func present(fromVC: UINavigationController, toVC: UIViewController)
}
