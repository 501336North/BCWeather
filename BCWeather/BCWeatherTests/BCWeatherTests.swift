//
//  BCWeatherTests.swift
//  BCWeatherTests
//
//  Created by Yanick Lavoie on 2019-05-24.
//  Copyright © 2019 PixelBuzz. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import BCWeather

class BCWeatherTests: XCTestCase {
    var openWeather: OpenWeather?

    override func setUp() {
        super.setUp()
        if let jsonPath = Bundle.main.path(forResource: "openWeatherMock", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: jsonPath)
                openWeather = Mapper<OpenWeather>().map(JSONString: contents)
            } catch {
                XCTFail("contents could not be loaded")
            }
        } else {
            XCTFail("json not found!")
        }
        XCTAssert(true)
    }

    override func tearDown() {
        openWeather = nil
        super.tearDown()
    }

    func testBCWeatherMainModuleCreation() {
        let navController = BCWeatherRouteWireFrame.createBCWeatherMainModule()
        if !(navController.children.first is BCWeatherMainViewController) {
            XCTFail("Module creation failed. BCWeatherMainController is nil")
            return
        }
    }

    func testBCWeatherPresenterCreation() {
        let navController = BCWeatherRouteWireFrame.createBCWeatherMainModule()
        let masterViewController = navController.children.first as! BCWeatherMainViewController

        if !(masterViewController.presenter is BCWeatherPresenter) {
            XCTFail("Presenter creation failed. BCWeatherMainController presenter is nil")
            return
        }
    }

    func testBCWeatherNavigateToDetail() {
        let navController = BCWeatherRouteWireFrame.createBCWeatherMainModule()
        let masterViewController = navController.children.first as! BCWeatherMainViewController

        guard let openWeather = openWeather else {
            XCTFail("openWeather is borked")
            return
        }
        masterViewController.presenter?.navigateToDetails(weather: openWeather, from: masterViewController)
            
        wait(for: 3)
        if !(navController.children.last is BCWeatherDetailViewController) {
            XCTFail("Navigation failed.")
            return
        }


    }


    // MARK: XCTest Helpers
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")

        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }

        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }

}
