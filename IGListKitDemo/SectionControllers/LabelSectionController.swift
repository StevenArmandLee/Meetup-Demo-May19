//
//  LabelSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 13/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class LabelSectionModel: NSObject, ListBoundable {
    func boundedSectionController() -> ListSectionController {
        return LabelSectionController()
    }
    
    let string: String
    let labelAttribute: LabelAttribute
    let cellAttribute: CellAttribute
    init(string: String, labelAttribute: LabelAttribute, cellAttribute: CellAttribute = CellAttribute()) {
        self.string = string
        self.labelAttribute = labelAttribute
        self.cellAttribute = cellAttribute
    }
}


final class LabelSectionController: ListSectionController {
    
    private var model: LabelSectionModel!
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: LabelCell.textHeight(model.string, width: width, font: model.labelAttribute.titleFont))
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.font = model.labelAttribute.titleFont
        cell.label.textColor = model.labelAttribute.titleColor
        cell.text = model.string
        cell.roundCorners(cornersRadius: model.cellAttribute.cornerRadius, radius: model.cellAttribute.cornerSize)
        cell.backgroundColor = model.cellAttribute.backgroundColor
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! LabelSectionModel)
    }
    
    override func didSelectItem(at index: Int) {
    }
}
