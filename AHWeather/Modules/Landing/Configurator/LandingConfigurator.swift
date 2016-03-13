//
//  LandingConfigurator.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class LandingModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LandingViewController {
            configure(viewController)
        }
    }

    private func configure(viewController: LandingViewController) {

        let router = LandingRouter()

        let presenter = LandingPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LandingInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? LandingPresenter {
            configure(presenter)
        }
    }
    
    private func configure(presenter: LandingPresenter) {
        
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
