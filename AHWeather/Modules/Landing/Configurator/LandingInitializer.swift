//
//  LandingInitializer.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var viewController: LandingViewController!

    override func awakeFromNib() {

        let configurator = LandingModuleConfigurator()
        configurator.configureModuleForViewInput(viewController)
    }

    init(presentor: AnyObject) {
        super.init()
        
        let configurator = LandingModuleConfigurator()
        configurator.configureModuleForPresenter(presentor)
    }
}
