//
//  MapPresenterTests.swift
//  AHWeather
//
//  Created by AroHak on 07/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import XCTest

class MapPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: MapInteractorInput {

    }

    class MockRouter: MapRouterInput {

    }

    class MockViewController: MapViewInput {

        func setupInitialState() {

        }
    }
}
