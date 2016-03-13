//
//  MapViewInput.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol MapViewInput: class {

    func setupInitialState(city: City)
    func updateLocation(location: CLLocation)
    func shakeTextField()
}
