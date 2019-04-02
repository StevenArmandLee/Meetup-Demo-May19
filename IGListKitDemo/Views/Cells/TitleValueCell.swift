//
//  PortfolioInformationCell.swift
//  FSInvestor
//
//  Created by steven lee on 8/10/18.
//  Copyright © 2018 Funding Societies. All rights reserved.
//

import UIKit

class TitleValueCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: PaddingLabel! {
        didSet {
            valueLabel.layer.cornerRadius = 4
            valueLabel.clipsToBounds = true
        }
    }
    
    private static let defaultFont = UIFont(name: "SFProText-Regular", size: 12)!
    
    static func textHeight(text: String, inset: UIEdgeInsets, width: CGFloat, font: UIFont = defaultFont, minHieght: CGFloat) -> CGFloat {
        let textHeight = text.height(withWidth: width - inset.left - inset.right, font: defaultFont)
        
        return max(textHeight + inset.top + inset.bottom, minHieght)
    }

}
