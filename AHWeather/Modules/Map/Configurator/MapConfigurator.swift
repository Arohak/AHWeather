//
//  MapConfigurator.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class MapModuleConfigurator {

    func configureModuleForPresenter(_ presenter: AnyObject) {
        
        if let presenter = presenter as? MapPresenter {
            configure(presenter)
        }
    }
    
    private func configure(_ presenter: MapPresenter) {
        
        let viewController = MapViewController()
        let interactor = MapInteractor()
        let router = MapRouter()

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }

}
