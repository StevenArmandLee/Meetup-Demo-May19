//
//  EmptySectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 24/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class EmptySectionModel:NSObject, ListBoundable {
    func boundedSectionController() -> ListSectionController {
        return EmptySectionController()
    }
    
    let height: CGFloat
    let cellAttribute: CellAttribute
    init(height: CGFloat, cellAttribute: CellAttribute = CellAttribute()) {
        self.height = height
        self.cellAttribute = cellAttribute
    }
}

final class EmptySectionController: ListSectionController {
    
    private var model: EmptySectionModel!
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: model.height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: EmptyCell.self, atIndex: index)
        cell.roundCorners(cornersRadius: model.cellAttribute.cornerRadius, radius: model.cellAttribute.cornerSize)
        cell.backgroundColor = model.cellAttribute.backgroundColor
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! EmptySectionModel)
    }
    
    override func didSelectItem(at index: Int) {
    }
}
