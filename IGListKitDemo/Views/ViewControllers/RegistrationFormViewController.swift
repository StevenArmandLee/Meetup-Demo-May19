//
//  RegistrationFoamViewController.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
class RegistrationFormViewController: UIViewController, ListAdapterOwner {
    var adapter: ListAdapter!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var stepTitle: UILabel!
    @IBOutlet weak var stepDescription: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: BaseRegistrationFormViewModel!
}

extension RegistrationFormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        ListAdapterBuilder.buid(self)
        
        navigationItem.title = "yea"
        stepTitle.text = viewModel.stepTitle
        stepDescription.text = viewModel.stepDescription
        stepImageView.image = UIImage(named: viewModel.stepImageName)
        progressBar.progress = 0.5
        viewModel.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension RegistrationFormViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let bottomAction = viewModel.getLowerData()
        let upperSectionHeight: CGFloat = collectionView.bounds.size.height - bottomAction.collectionViewHeight
        let upperData =
            RegistrationFoamVerticalSectionModel(data: RegistrationFoamSectionFactoryModel(data: viewModel.getUpperData()), collectionViewHeight: upperSectionHeight)
        return [upperData, bottomAction]
    }
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return RegistrationFoamVerticalSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


//Remark:BaseRegistrationFormViewModelDelegate
extension RegistrationFormViewController: BaseRegistrationFormViewModelDelegate {
    func onSaved() {
        //do something here
    }
    func reload() {
        adapter.performUpdates(animated: true, completion: nil)
    }
}
