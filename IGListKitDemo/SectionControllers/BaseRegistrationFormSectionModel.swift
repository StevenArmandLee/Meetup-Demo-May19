//
//  BaseRegistrationFormSectionModel.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
protocol FieldValidatable {
    func isValid() -> Bool
    var regexPattern: String? {get set}
}


protocol BaseRegistrationFormSectionModel: ListDiffable {
    func onSave()
}
