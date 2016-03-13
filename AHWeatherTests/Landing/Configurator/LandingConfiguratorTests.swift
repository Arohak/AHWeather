//
//  LandingConfiguratorTests.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import XCTest

class LandingModuleConfiguratorTests: XCTestCase {

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
        let viewController = LandingViewControllerMock()
        let configurator = LandingModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "LandingViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LandingPresenter, "output is not LandingPresenter")

        let presenter: LandingPresenter = viewController.output as! LandingPresenter
        XCTAssertNotNil(presenter.view, "view in LandingPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in LandingPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is LandingRouter, "router is not LandingRouter")

        let interactor: LandingInteractor = presenter.interactor as! LandingInteractor
        XCTAssertNotNil(interactor.output, "output in LandingInteractor is nil after configuration")
    }

    class LandingViewControllerMock: LandingViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
