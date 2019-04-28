//
//  PortfolioActionCell.swift
//  FSInvestor
//
//  Created by steven lee on 11/10/18.
//  Copyright © 2018 Funding Societies. All rights reserved.
//

import UIKit

class ActionCell: UICollectionViewCell {
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet weak var actionNameLabel: UILabel!
    
    fileprivate static let titleInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    fileprivate static let titleFont = UIFont(name: "Gilroy-SemiBold", size: 16)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func textHeight(_ text: String, width: CGFloat, insets: UIEdgeInsets = titleInsets, font: UIFont = titleFont) -> CGFloat {
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [ NSAttributedString.Key.font: font ]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(bounds.height) + insets.top + insets.bottom
    }

}
