//
//  TitleValueSectionController.swift
//  FSInvestor
//
//  Created by steven lee on 22/11/18.
//  Copyright © 2018 Funding Societies. All rights reserved.
//

import Foundation
import IGListKit
import UIKit
final class LabelAttribute {
    let titleColor: UIColor
    let titleFont: UIFont
    init(titleColor: UIColor, titleFont: UIFont) {
        self.titleColor = titleColor
        self.titleFont = titleFont
    }
}
final class TitleValueSectionModel: NSObject {
    let title: String
    let value: String
    let titleAttribute: LabelAttribute
    let valueAttribute: LabelAttribute
    let cornerRadius: CornerRadius
    let backgroundColor: UIColor
    init(title: String, value: String, titleAttribute: LabelAttribute, valueAttribute: LabelAttribute, cornerRadius: CornerRadius = .none, backgroundColor: UIColor = .clear) {
        self.title = title
        self.value = value
        self.titleAttribute = titleAttribute
        self.valueAttribute = valueAttribute
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
}

final class TitleValueSectionController: ListSectionController {
    
    private var model: TitleValueSectionModel!
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext?.containerSize.width ?? 0
        let bothHeight: CGFloat = PairedTitleValueCell.textHeight(text: model.title + model.value, inset: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), width: width, font: model.titleAttribute.titleFont)
        let valueHeight: CGFloat = PairedTitleValueCell.textHeight(text: model.value, inset: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), width: width * 0.7, font: model.titleAttribute.titleFont)
        return CGSize(width: width, height: max(bothHeight, valueHeight))
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = dequeCell(type: PairedTitleValueCell.self, atIndex: index)
        cell.viewModel = model
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! TitleValueSectionModel)
    }
    
    override func didSelectItem(at index: Int) {
    }
}