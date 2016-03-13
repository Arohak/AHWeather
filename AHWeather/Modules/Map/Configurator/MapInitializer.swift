//
//  MapInitializer.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapModuleInitializer: NSObject {

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = MapModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
