//
//  XCTestCase.swift
//  FSInvestorTests
//
//  Created by steven lee on 16/1/19.
//  Copyright © 2019 Funding Societies. All rights reserved.
//

import Foundation
import XCTest
extension XCTestCase {
    
    private func setWaitExpectation(_ withLifeCycle: TimeInterval) {
        let exp = expectation(description: "preview time out")
        let result = XCTWaiter.wait(for: [exp], timeout: withLifeCycle)
        print(result)
        switch(result) {
        case .completed:
            break
        case .timedOut:
            exp.fulfill()
        case .incorrectOrder:
            break
        case .invertedFulfillment:
            break
        case .interrupted:
            break
        }
    }
    
    func loadViewController(_ viewController: UIViewController, withLifeCycle: TimeInterval = 60) {
        UIApplication.shared.keyWindow!.rootViewController = viewController
        XCTAssertNotNil(viewController.view)
        setWaitExpectation(withLifeCycle)
    }
    
    func loadNavigationController(_ navigationController: UINavigationController, withLifeCycle: TimeInterval = 60) {
        UIApplication.shared.keyWindow!.rootViewController = navigationController
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(navigationController.topViewController?.view)
        setWaitExpectation(withLifeCycle)
    }
}
