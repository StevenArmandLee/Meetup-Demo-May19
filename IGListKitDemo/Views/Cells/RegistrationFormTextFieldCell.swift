//
//  RegistrationFormTextFieldCell.swift
//  IGListKitDemo
//
//  Created by steven lee on 3/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import UIKit

class RegistrationFormTextFieldCell: UICollectionViewCell {
    @IBOutlet weak var textField: UITextField!
    var actionable: ActionableItem?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onValueChanged(_ sender: UITextField) {
        actionable?.onAction(sender.text)
    }
}
