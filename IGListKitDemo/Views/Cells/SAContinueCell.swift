//
//  SAContinueCell.swift
//  FSInvestor
//
//  Created by steven lee on 1/3/19.
//  Copyright © 2019 Funding Societies. All rights reserved.
//

import UIKit

class SAContinueCell: UICollectionViewCell {
    var actionable: ActionableItem?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onPressed(_ sender: Any) {
        actionable?.onPressed(nil)
    }
    
}
