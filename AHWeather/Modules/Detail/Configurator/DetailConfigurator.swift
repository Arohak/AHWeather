//
//  DetailConfigurator.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

class DetailModuleConfigurator {

    func configureModuleForPresenter(presenter: AnyObject) {
        
        if let presenter = presenter as? DetailPresenter {
            configure(presenter)
        }
    }
    
    private func configure(presenter: DetailPresenter) {
        
        let viewController = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
