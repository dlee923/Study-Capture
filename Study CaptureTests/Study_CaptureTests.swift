//
//  Study_CaptureTests.swift
//  Study CaptureTests
//
//  Created by Daniel Lee on 5/3/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import XCTest
@testable import Study_Capture

class Study_CaptureTests: XCTestCase {

    var selfieViewController: SelfieViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.selfieViewController = SelfieViewController()
        self.selfieViewController?.setup()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.selfieViewController = nil
    }

    func testUserInputValidity() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        self.selfieViewController?.userField.text = "defaultUser"
        let valid = self.selfieViewController.userTextIsValid()
        XCTAssert(valid == true, "user is not valid")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
