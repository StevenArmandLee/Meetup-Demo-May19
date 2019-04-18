//
//  ListSectionControler.swift
//  IGListKitDemo
//
//  Created by steven lee on 13/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
extension ListSectionController {
    func dequeCell<T>(type: T.Type, atIndex index: Int) -> T {
        let className = String(describing: type)
        return collectionContext!.dequeueReusableCell(withNibName: className, bundle: nil, for: self, at: index) as! T
    }
    
    func applyCornerMask(forCell cell: UICollectionViewCell, index: Int) {
        let itemsCount = numberOfItems()
        if itemsCount == 1 {
            cell.applyRoundCornerMaskFull()
        } else if index == 0 {
            cell.applyRoundCornerMaskTop()
        } else if index == itemsCount - 1 {
            cell.applyRoundCornerMaskBottom()
        } else {
            cell.removeRoundCornerMask()
        }
    }
}
