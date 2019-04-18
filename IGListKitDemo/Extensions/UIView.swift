//
//  UIView.swift
//  IGListKitDemo
//
//  Created by steven lee on 13/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import UIKit
enum CornerRadius {
    case top
    case none
    case bottom
    case both
}
extension UIView {
    func roundCorners(cornersRadius: CornerRadius, radius: CGFloat, height: CGFloat? = nil) {
        var corners: UIRectCorner = UIRectCorner(arrayLiteral: [])
        switch cornersRadius {
        case .both:
            corners = UIRectCorner(arrayLiteral: [.topLeft, .topRight, .bottomLeft, .bottomRight])
        case .bottom:
            corners = UIRectCorner(arrayLiteral: [.bottomLeft, .bottomRight])
        case .top:
            corners = UIRectCorner(arrayLiteral: [.topLeft, .topRight])
        case .none:
            corners = UIRectCorner(arrayLiteral: [])
        }
        var rect = bounds
        if let height = height {
            rect.size.height = height
        }
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func removeRoundCornerMask() {
        applyRoundCornerMask(top: false, bottom: false)
    }
    
    func applyRoundCornerMaskTop(cornerRadius: CGFloat = 8.0) {
        applyRoundCornerMask(top: true, bottom: false)
    }
    
    func applyRoundCornerMaskBottom(cornerRadius: CGFloat = 8.0) {
        applyRoundCornerMask(top: false, bottom: true)
    }
    
    func applyRoundCornerMaskFull(cornerRadius: CGFloat = 8.0) {
        applyRoundCornerMask(top: true, bottom: true)
    }
    
    private func applyRoundCornerMask(top: Bool, bottom: Bool, cornerRadius: CGFloat = 8.0) {
        
        guard top || bottom else {
            layer.mask = nil
            return
        }
        
        let maskLayer = CAShapeLayer()
        let cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        var byRoundingCorners: UIRectCorner = []
        if top && bottom {
            byRoundingCorners = .allCorners
        } else if top {
            byRoundingCorners = [.topRight, .topLeft]
        } else if bottom {
            byRoundingCorners = [.bottomLeft, .bottomRight]
        }
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: byRoundingCorners, cornerRadii: cornerRadii).cgPath
        layer.mask = maskLayer
    }
}
