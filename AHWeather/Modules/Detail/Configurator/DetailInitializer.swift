//
//  DetailInitializer.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = DetailModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
