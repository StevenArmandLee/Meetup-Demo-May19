//
//  DemoItemSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 18/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class DemoItem: NSObject {
    
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(
        name: String,
        controllerClass: UIViewController.Type,
        controllerIdentifier: String? = nil
        ) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }
    
}

extension DemoItem {
    
    override func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    
    override func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? DemoItem else { return false }
        return controllerClass == object.controllerClass && controllerIdentifier == object.controllerIdentifier
    }
    
}

final class DemoSectionController: ListSectionController {
    
    private var object: DemoItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = object?.name
        cell.label.textColor = UIColor.black
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? DemoItem
    }
    
    override func didSelectItem(at index: Int) {
        if let identifier = object?.controllerIdentifier {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: identifier)
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        } else if let controller = object?.controllerClass.init() {
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
