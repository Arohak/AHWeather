//
//  LandingViewInput.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

@objc protocol LandingViewInput: class {

    func setupInitialState(items: Array<Weather>)
}
