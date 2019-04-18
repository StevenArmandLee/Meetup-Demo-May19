//
//  RegistrationFormContinueSectionModel.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class RegistrationFormContinueSectionModel: NSObject {
    let actionAble: ActionableItem
    init(actionAble: ActionableItem) {
        self.actionAble = actionAble
    }
}

final class RegistrationFormContinueSectionController: ListSectionController {
    
    private var model: RegistrationFormContinueSectionModel!
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 65)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: SAContinueCell.self, atIndex: index)
        cell.actionable = model.actionAble
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! RegistrationFormContinueSectionModel)
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
