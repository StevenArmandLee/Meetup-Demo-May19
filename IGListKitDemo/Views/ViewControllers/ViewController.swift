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
        let label = LabelSectionModel(string: "This is title", labelAttribute: titleAtribute, cellAttribute: upperCellTheme)
        let separator = EmptySectionModel(height: 1, cellAttribute: CellAttribute(backgroundColor: .white))
        let anotherLabel = LabelSectionModel(string: "This is title", labelAttribute: titleValueAttribute, cellAttribute: cellTheme)
        let titleValue = TitleValueSectionModel(title: "Title", value: "Value", titleAttribute: titleValueAttribute, valueAttribute: titleValueAttribute)
        let demoItem = DemoItem(name: "push a view controller", controllerClass: DashboardViewController.self, controllerIdentifier: "DashboardViewController")
        let actionable = ActionLabelSectionModel(actionAble: ActionableItem(onAction: { (_) in
            print("yea")
        }), title: "yea", height: 50, labelAttribute: titleAtribute, cellAttribute: CellAttribute(cornerRadius: .both, cornerSize: 8, backgroundColor: UIColor(red: 62/255, green: 126/255, blue: 1, alpha: 1)))
        let goToAdvanced = ActionLabelSectionModel(actionAble: ActionableItem(onAction: { (_) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "RegistrationFormViewController") as! RegistrationFormViewController
            controller.viewModel = SampleRegistrationFormViewModel()
            self.navigationController?.pushViewController(controller, animated: true)
        }), title: "go to advanced example", height: 50, labelAttribute: titleAtribute, cellAttribute: CellAttribute(cornerRadius: .both, cornerSize: 8, backgroundColor: UIColor(red: 62/255, green: 126/255, blue: 1, alpha: 1)))
        
        return [EmptySectionModel(height: 20),
            label,
            separator,
            anotherLabel,
            demoItem,
            actionable,
            goToAdvanced
        ]
        
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is LabelSectionModel {
            return LabelSectionController()
        } else if object is DemoItem {
            return DemoSectionController()
        } else if object is EmptySectionModel {
            return EmptySectionController()
        } else if object is ActionLabelSectionModel {
            return ActionLabelSectionController()
        }
        return TitleValueSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}

