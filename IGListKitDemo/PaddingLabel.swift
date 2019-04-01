//
//  PaddingLabel.swift
//  FSInvestor
//
//  Created by steven lee on 6/9/18.
//  Copyright © 2018 Funding Societies. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let attributes: [NSAttributedString.Key: Any] = [ NSAttributedString.Key.font: font ]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        if let actualWidth = (text as NSString?)?.boundingRect(with: rect.size, options: options, attributes: attributes, context: nil).width {
            let actualX = rect.origin.x + (rect.width - actualWidth) * 0.5
            let actualRect = CGRect(x: actualX, y: rect.origin.y, width: actualWidth, height: rect.height)
            super.drawText(in: actualRect)
        }

    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
