//
//  BaseRegistrationFormViewModel.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit


/**
 - parameters:
 - stepTitle:
 - stepDescription:
 - firebaseStep:
 
 ### Functions
 - save(): login is successful and there is no extra step needed
 - getLowerData() -> SAVerticalSectionModel: overwrite this to return no data if you would like to have no continue button
 - getUpperData() -> [Any]:
 */
protocol BaseRegistrationFormViewModelDelegate: class {
    func onSaved()
    func reload()
}
protocol BaseRegistrationFormViewModel: class {
    var delegate: BaseRegistrationFormViewModelDelegate? {get set}
    var currentStep: Int {get set}
    var stepTitle: String {get}
    var stepDescription: String {get}
    var stepImageName: String {get}
    var data: [ListDiffable] {get set}
    
    /**
     Call this method to perform saving action
     - Important:
     This method is normally called from the view controller, when user clicks the continue button
     */
    func save()
    
    func updateReferenceData()
    
    // MARK: --- optional methods ---
    func getUpperData() -> [Any]
    func getLowerData() -> RegistrationFoamVerticalSectionModel
    
    /**
     Call this method when you want to save all changes to firebase, and move screen accroding to action
     - Important:
     It will save all the changes to local SA info object, and update the firebase cloud storage
     */
    
    func checkAllFieldsAreValid() -> Bool
    
    func shouldShowContinueButton() -> Bool
}
extension BaseRegistrationFormViewModel {
    
    func checkAllFieldsAreValid() -> Bool {
        for model in data {
            if let model = model as? FieldValidatable {
                if !(model.isValid()) {
                    return false
                }
            }
        }
        return true
    }
    
    func getUpperData() -> [Any] {
        return data
    }
    
    func updateReferenceData() {
        data.forEach {($0 as? BaseRegistrationFormSectionModel)?.onSave()}
    }
    
    func getLowerData() -> RegistrationFoamVerticalSectionModel {
        
        let continueSection = RegistrationFormContinueSectionModel(actionAble: ActionableItem { (_) in
            self.save()
        })
        return RegistrationFoamVerticalSectionModel(data: RegistrationFoamSectionFactoryModel(data: [continueSection]), collectionViewHeight: 65)
    }
    
    func shouldShowContinueButton() -> Bool {
        return true
    }
}
