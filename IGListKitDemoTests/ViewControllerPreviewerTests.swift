//
//  ViewControllerPreviewerTests.swift
//  IGListKitDemoTests
//
//  Created by steven lee on 3/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import XCTest
@testable import IGListKitDemo
class ViewControllerPreviewerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RegistrationFormViewController") as! RegistrationFormViewController
        controller.viewModel = SampleRegistrationFormViewModel()
        self.loadViewController(UINavigationController(rootViewController: controller))
    }

}
