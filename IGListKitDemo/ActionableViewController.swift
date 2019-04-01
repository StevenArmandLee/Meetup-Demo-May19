//
//  ActionableViewController.swift
//  IGListKitDemo
//
//  Created by steven lee on 18/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import Foundation
import UIKit
class ActionableViewController {
    var onPressed: () -> UIViewController{
        didSet{
            
        }
    }
    
    init(onPressed: @escaping () -> UIViewController) {
        self.onPressed = onPressed
        
    }
}
