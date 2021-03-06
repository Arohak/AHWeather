//
//  LandingConfigurator.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingModuleConfigurator {
    
    func configureModuleForPresenter(_ presenter: AnyObject) {
        
        if let presenter = presenter as? LandingPresenter {
            configure(presenter)
        }
    }
    
    private func configure(_ presenter: LandingPresenter) {
        
        let viewController = LandingViewController()
        let interactor = LandingInteractor()
        let router = LandingRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
