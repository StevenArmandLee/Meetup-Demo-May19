//
//  RegistrationFormTextFieldSectionModelTests.swift
//  IGListKitDemoTests
//
//  Created by steven lee on 18/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import XCTest
@testable import IGListKitDemo
class RegistrationFormTextFieldSectionModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_isValid_givenEmptyCurrentValue_returnFalse() {
        var string : String? = ""
        let registrationFormTextFieldSectionModel = RegistrationFormTextFieldSectionModel(valuereference: &string, placeHolder: "", title: "")
        XCTAssert(registrationFormTextFieldSectionModel.isValid() == false)
    }
    
    func test_isValid_givenEmptyCurrentValueAndOptionalTrue_returnTrue() {
        var string : String? = ""
        let registrationFormTextFieldSectionModel = RegistrationFormTextFieldSectionModel(valuereference: &string, placeHolder: "", title: "", isOptional: true)
        XCTAssert(registrationFormTextFieldSectionModel.isValid() == true)
    }
    
    func test_isValid_givenNumbersWithAtLeastOneCharactertExist_returnFalse() {
        var string : String? = "1"
        let registrationFormTextFieldSectionModel = RegistrationFormTextFieldSectionModel(valuereference: &string, placeHolder: "", title: "")
        registrationFormTextFieldSectionModel.regexPattern = "(?=.*[a-z])"
        XCTAssert(registrationFormTextFieldSectionModel.isValid() == false)
    }
    
    func test_isValid_givenChractersWithAtLeastOneCharactertExist_returnFalse() {
        var string : String? = "abb"
        let registrationFormTextFieldSectionModel = RegistrationFormTextFieldSectionModel(valuereference: &string, placeHolder: "", title: "")
        registrationFormTextFieldSectionModel.regexPattern = "(?=.*[a-z])"
        XCTAssert(registrationFormTextFieldSectionModel.isValid() == true)
    }
    
    func test_isValid_givenChractersWithNoRegex_returnTrue() {
        var string : String? = "abb"
        let registrationFormTextFieldSectionModel = RegistrationFormTextFieldSectionModel(valuereference: &string, placeHolder: "", title: "")
        XCTAssert(registrationFormTextFieldSectionModel.isValid() == true)
    }
    
}
