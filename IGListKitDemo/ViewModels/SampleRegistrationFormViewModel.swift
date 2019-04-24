//
//  SampleRegistrationFormViewModel.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
class SampleRegistrationFormViewModel: BaseRegistrationFormViewModel {
    var delegate: BaseRegistrationFormViewModelDelegate?
    
    var currentStep: Int = 1
    
    var stepTitle: String = "Demo"
    
    var stepDescription: String = "Demo Description"
    
    var stepImageName: String = "Image"
    
    var data: [ListDiffable]
    
    let user: User = User()
    
    init() {
        user.firstName = "Steven"
        user.lastName = "Lee"
        data = [
                RegistrationFormTextFieldSectionModel(valuereference: &user.firstName, placeHolder: "Frist Name", title: "Frist Name"),
                RegistrationFormTextFieldSectionModel(valuereference: &user.lastName, placeHolder: "Last Name", title: "Last Name"),
                RegistrationFormTextFieldSectionModel(valuereference: &user.address, placeHolder: "address", title: "address")
        ]
    }
}
extension SampleRegistrationFormViewModel {
    func save() {
        if checkAllFieldsAreValid() {
            updateReferenceData()
        }
    }
}
