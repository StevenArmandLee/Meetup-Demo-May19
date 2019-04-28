//
//  ActionLabelSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 28/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class ActionLabelSectionModel: NSObject, ListBoundable {
    func boundedSectionController() -> ListSectionController {
        return ActionLabelSectionController()
    }
    let actionAble: ActionableItem
    let height: CGFloat
    let labelAttribute: LabelAttribute
    let cellAttribute: CellAttribute
    let title: String
    init(actionAble: ActionableItem, title: String, height: CGFloat, labelAttribute: LabelAttribute, cellAttribute: CellAttribute = CellAttribute()) {
        self.actionAble = actionAble
        self.title = title
        self.height = height
        self.labelAttribute = labelAttribute
        self.cellAttribute = cellAttribute
    }
}

final class ActionLabelSectionController: ListSectionController {
    private var model: ActionLabelSectionModel!
    
    override init() {
        super.init()
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: model.height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: ActionCell.self, atIndex: index)
        cell.topLineView.isHidden = true
        cell.actionNameLabel.text = model.title
        cell.backgroundColor = model.cellAttribute.backgroundColor
        cell.roundCorners(cornersRadius: model.cellAttribute.cornerRadius, radius: model.cellAttribute.cornerSize)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! ActionLabelSectionModel)
        
    }
    
    override func didSelectItem(at index: Int) {
        model.actionAble.onAction(nil)
    }
}
