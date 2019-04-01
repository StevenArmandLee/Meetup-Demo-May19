//
//  ViewController.swift
//  IGListKitDemo
//
//  Created by steven lee on 13/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import UIKit
import IGListKit
class ViewController: UIViewController, ListAdapterOwner {
    var adapter: ListAdapter!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListAdapterBuilder.buid(self)
    }
}

//Remark: ListAdapterDataSource
extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [LabelSectionModel(string: "test", color: .black, font: UIFont.systemFont(ofSize: 16)),
                TitleValueSectionModel(title: "test", value: "yea", titleAttribute: LabelAttribute(titleColor: .black, titleFont: .systemFont(ofSize: 16)), valueAttribute: LabelAttribute(titleColor: .black, titleFont: .systemFont(ofSize: 16))),
                DemoItem(name: "test", controllerClass: DashboardViewController.self, controllerIdentifier: "DashboardViewController")]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is LabelSectionModel {
            return LabelSectionController()
        } else if object is DemoItem {
            return DemoSectionController()
        }
        return TitleValueSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}

