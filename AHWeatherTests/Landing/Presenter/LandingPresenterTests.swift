//
//  LandingPresenterTests.swift
//  AHWeather
//
//  Created by AroHak on 02/03/2016.
//  Copyright © 2016 AroHak LLC. All rights reserved.
//

import XCTest

class LandingPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: LandingInteractorInput {

    }

    class MockRouter: LandingRouterInput {

    }

    class MockViewController: LandingViewInput {

        func setupInitialState() {

        }
    }
}
