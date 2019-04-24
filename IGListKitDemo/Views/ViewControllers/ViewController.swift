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
    
    let titleAtribute: LabelAttribute = LabelAttribute(titleColor: .white, titleFont: UIFont.systemFont(ofSize: 26))
    let titleValueAttribute: LabelAttribute = LabelAttribute(titleColor: .white, titleFont: UIFont.systemFont(ofSize: 16))
    
    let cellTheme: CellAttribute = CellAttribute(backgroundColor: UIColor.white.withAlphaComponent(0.2))
    let upperCellTheme: CellAttribute = CellAttribute(cornerRadius: .top, cornerSize: 8, backgroundColor: UIColor.white.withAlphaComponent(0.2))
    let lowerCellTheme: CellAttribute = CellAttribute(cornerRadius: .bottom, cornerSize: 8, backgroundColor: UIColor.white.withAlphaComponent(0.2))
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        ListAdapterBuilder.buid(self)
    }
}

//Remark: ListAdapterDataSource
extension ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        return [EmptySectionModel(height: 20),
                LabelSectionModel(string: "This is title", labelAttribute: titleAtribute, cellAttribute: upperCellTheme),
                EmptySectionModel(height: 1, cellAttribute: CellAttribute(backgroundColor: .white)),
                LabelSectionModel(string: "This is title", labelAttribute: titleValueAttribute, cellAttribute: cellTheme),
                TitleValueSectionModel(title: "Title", value: "Value", titleAttribute: titleValueAttribute, valueAttribute: titleValueAttribute),
                DemoItem(name: "test", controllerClass: DashboardViewController.self, controllerIdentifier: "DashboardViewController")
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is LabelSectionModel {
            return LabelSectionController()
        } else if object is DemoItem {
            return DemoSectionController()
        } else if object is EmptySectionModel {
            return EmptySectionController()
        }
        return TitleValueSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}

