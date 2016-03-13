//
//  LandingViewOutput.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

@objc protocol LandingViewOutput {

    func viewIsReady()
    func viewIsSelectItem(item: Weather)
}
