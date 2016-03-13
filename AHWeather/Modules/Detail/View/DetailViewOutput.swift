//
//  DetailViewOutput.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

protocol DetailViewOutput {

    func viewIsReady()
    func backAction()
    func searchAction()
    func fiveDayAction()
    func tenDayAction()
    func updateAction()
}
