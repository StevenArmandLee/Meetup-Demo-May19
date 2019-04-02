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
    
    func save() {
        
    }
    
    init() {
        data = [LabelSectionModel(string: "test", color: .black, font: UIFont.systemFont(ofSize: 16))]
    }
    
    
}
