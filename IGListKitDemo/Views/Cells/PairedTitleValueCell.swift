//
//  PairedTitleValueCell.swift
//  FSInvestor
//
//  Created by steven lee on 22/11/18.
//  Copyright © 2018 Funding Societies. All rights reserved.
//

import UIKit

class PairedTitleValueCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var viewModel: TitleValueSectionModel! {
        didSet {
            self.titleLabel.text = viewModel.title
            self.titleLabel.font = viewModel.titleAttribute.titleFont
            self.titleLabel.textColor = viewModel.titleAttribute.titleColor
            self.valueLabel.text = viewModel.value
            self.valueLabel.font = viewModel.valueAttribute.titleFont
            self.valueLabel.textColor = viewModel.valueAttribute.titleColor
            self.backgroundColor = viewModel.backgroundColor
            self.roundCorners(cornersRadius: viewModel.cornerRadius, radius: 8)
        }
    }
    
    static func textHeight(text: String, inset: UIEdgeInsets, width: CGFloat, font: UIFont) -> CGFloat {
        let spacing: CGFloat = 8
        let textHeight = text.height(withWidth: width - inset.left - inset.right - spacing, font: font)
        
        return textHeight + 4 + inset.bottom
    }
}

