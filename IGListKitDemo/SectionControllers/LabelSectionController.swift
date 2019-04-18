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
    let color: UIColor
    let font: UIFont
    init(string: String, color: UIColor, font: UIFont) {
        self.string = string
        self.color = color
        self.font = font
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
        return CGSize(width: width, height: LabelCell.textHeight(model.string, width: width, font: model.font))
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as! LabelCell
        cell.label.font = model.font
        cell.label.textColor = model.color
        cell.text = model.string
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! LabelSectionModel)
    }
    
    override func didSelectItem(at index: Int) {
    }
}
