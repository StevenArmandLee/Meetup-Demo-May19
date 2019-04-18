//
//  BaseRegistrationFormSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 3/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
class BaseRegistrationFormSectionController: ListSectionController {
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 80)
    }
}
