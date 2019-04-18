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
        user.firstName = "steven"
        data = [LabelSectionModel(string: "test", color: .black, font: UIFont.systemFont(ofSize: 16)), RegistrationFormTextFieldSectionModel(valuereference: &user.firstName, placeHolder: "Frist Name", title: "Frist Name")]
    }
}
extension SampleRegistrationFormViewModel {
    func save() {
        if checkAllFieldsAreValid() {
            updateReferenceData()
        }
    }
}
