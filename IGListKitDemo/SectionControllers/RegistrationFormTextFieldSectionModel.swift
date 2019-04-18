//
//  RegistrationFormTextFieldSectionModel.swift
//  IGListKitDemo
//
//  Created by steven lee on 3/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit

final class RegistrationFormTextFieldSectionModel: NSObject, BaseRegistrationFormSectionModel, FieldValidatable {
    let valuereference: UnsafeMutablePointer<String?>
    let placeHolder: String
    let title: String
    let keyboardType: UIKeyboardType
    var isOptional: Bool
    var currentValue: String?
    var injectAction: ActionableItem?
    var showErrorAction: ActionableItem?
    weak var scrollDelegate: RegistrationFoamAutoScrollDelegate?
    var currentErrorMessage: String?
    init(valuereference: UnsafeMutablePointer<String?>, placeHolder: String, title: String, keyboardType: UIKeyboardType = .default, isOptional: Bool = false) {
        self.valuereference = valuereference
        self.currentValue = valuereference.pointee
        self.placeHolder = placeHolder
        self.title = title
        self.keyboardType = keyboardType
        self.isOptional = isOptional
    }
    func onSave() {
        valuereference.pointee = currentValue
    }
    
    func injectCurrentText(_ text: String) {
        injectAction?.onAction(text)
    }
    
    func isValid() -> Bool {
        if isOptional {
            return true
        } else {
            guard let currentValue = currentValue, !currentValue.isEmpty else {
                print(title + " value is empty")
                return false
            }
            guard let regexPattern = regexPattern else { return true }
            guard let regex = try? NSRegularExpression(pattern: regexPattern) else { return false }
            let range = NSRange(location: 0, length: currentValue.utf16.count)
            let isRegexMatches = regex.firstMatch(in: currentValue, range: range) != nil
            if !isRegexMatches {
                print(title + " regex does not match")
            }
            return isRegexMatches
        }
    }
    
    var regexPattern: String?
    
    
    var onErrorAction: ActionableItem?
}

final class RegistrationFormTextFieldSectionController: BaseRegistrationFormSectionController {
    weak var sectionScrollDelegate: RegistrationFoamAutoScrollDelegate?
    private var model: RegistrationFormTextFieldSectionModel!
    
    init(scrollDelegate: RegistrationFoamAutoScrollDelegate?) {
        self.sectionScrollDelegate = scrollDelegate
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: RegistrationFormTextFieldCell.self, atIndex: index)
        cell.textField.text = model.currentValue
        cell.textField.placeholder = model.placeHolder
        cell.textField.keyboardType = model.keyboardType
        cell.actionable = ActionableItem(onAction: {(text) in
            if let text = text as? String {
                self.model.currentValue = text
            }
        })
        if model.currentErrorMessage != nil {
            _ = cell.textField.becomeFirstResponder()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! RegistrationFormTextFieldSectionModel)
        model.scrollDelegate = self.sectionScrollDelegate
        model.injectAction = ActionableItem(onAction: { (text) in
            if let text = text as? String {
                guard let cell = self.collectionContext?.cellForItem(at: 0, sectionController: self) as? RegistrationFormTextFieldCell else { return }
                cell.textField.text = text
                self.model.currentValue = text
            }
        })
        
        model.onErrorAction = ActionableItem(onAction: { (object) in
            self.model.currentErrorMessage = object as? String
            self.model.scrollDelegate?.scrollTo(model: self.model)
            self.collectionContext?.performBatch(animated: true, updates: { (batchContext) in
                batchContext.reload(self)
            }, completion: nil)
        })
    }
    
    override func didSelectItem(at index: Int) {
    }
}
