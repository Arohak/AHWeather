//
//  MapRouter.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapRouter: MapRouterInput {
    
    func dismiss(vc: UIViewController) {
        vc.dismissViewControllerAnimated(true, completion: nil)
    }
}
