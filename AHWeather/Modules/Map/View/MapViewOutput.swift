//
//  MapViewOutput.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol MapViewOutput {

    func viewIsReady()
    func searchAction(city: String)
    func updateAction(city: String)
    func cancelAction()
}
