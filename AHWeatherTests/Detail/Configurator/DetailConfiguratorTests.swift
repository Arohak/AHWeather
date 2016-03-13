//
//  DetailConfiguratorTests.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import XCTest

class DetailModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = DetailViewControllerMock()
        let configurator = DetailModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "DetailViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DetailPresenter, "output is not DetailPresenter")

        let presenter: DetailPresenter = viewController.output as! DetailPresenter
        XCTAssertNotNil(presenter.view, "view in DetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DetailRouter, "router is not DetailRouter")

        let interactor: DetailInteractor = presenter.interactor as! DetailInteractor
        XCTAssertNotNil(interactor.output, "output in DetailInteractor is nil after configuration")
    }

    class DetailViewControllerMock: DetailViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
