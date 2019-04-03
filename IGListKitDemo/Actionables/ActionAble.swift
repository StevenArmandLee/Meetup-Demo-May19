//
//  ActionAble.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
typealias ActionBlock = (Any?) -> Void
class ActionableItem {
    var onAction: ActionBlock{
        didSet{
            
        }
    }
    
    init(onAction: @escaping ActionBlock) {
        self.onAction = onAction
        
    }
}
