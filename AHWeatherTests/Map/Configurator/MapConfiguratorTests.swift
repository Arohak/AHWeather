//
//  MapConfiguratorTests.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import XCTest

class MapModuleConfiguratorTests: XCTestCase {

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
        let viewController = MapViewControllerMock()
        let configurator = MapModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "MapViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MapPresenter, "output is not MapPresenter")

        let presenter: MapPresenter = viewController.output as! MapPresenter
        XCTAssertNotNil(presenter.view, "view in MapPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MapPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MapRouter, "router is not MapRouter")

        let interactor: MapInteractor = presenter.interactor as! MapInteractor
        XCTAssertNotNil(interactor.output, "output in MapInteractor is nil after configuration")
    }

    class MapViewControllerMock: MapViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
