//
//  RegistrationFoamSectionFactory.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit
protocol RegistrationFoamAutoScrollDelegate: class {
    func scrollTo(model: ListDiffable)
}
final class RegistrationFoamSectionFactoryModel: NSObject {
    let data: [Any]
    init(data: [Any]) {
        self.data = data
    }
}

final class RegistrationFoamSectionFactory: ListSectionController, ListAdapterDataSource {
    
    private var model: RegistrationFoamSectionFactoryModel!
    
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: collectionContext!.containerSize.height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: EmbeddedCollectionViewCell.self,
                                                                for: self,
                                                                at: index) as? EmbeddedCollectionViewCell else {
                                                                    fatalError()
        }
        cell.scrollDirection = .vertical
        cell.collectionView.alwaysBounceHorizontal = false
        cell.collectionView.showsVerticalScrollIndicator = false
        cell.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        adapter.collectionView = cell.collectionView
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.model = (object as! RegistrationFoamSectionFactoryModel)
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return model.data as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        if object is SACountryPickerSectionModel {
//            return SACountryPickerSectionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is SAPhoneNumberSectionModel {
//            return SAPhoneNumberSectionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is SAPickerSectionModel {
//            return SAPickerSectionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is SAAdditionalWealthSourcesSectionModel {
//            return SAAdditionalWealthSourcesSectionController()
//        } else if object is SAUploadImageSectionModel {
//            return SAUploadImageSectionController()
//        } else if object is SASearchAddressTextFieldSectionModel {
//            return SASearchAddressTextFieldSectionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is SATitleImageSectionModel {
//            return SATitleImageSectionController()
//        } else if object is SATitleSegmentSectionModel {
//            return SATitleSegmentController()
//        } else if object is SADatePickerSecionModel {
//            return SADatePickerSecionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is SAContinueSectionModel {
//            return SAContinueSectionController()
//        } else if object is SAAutoFillSectionModel {
//            return SAAutoFillSectionController(delegate: model.delegate, scrollDelegate: self)
//        } else if object is LabelSectionModel {
//            return LabelSectionController()
//        } else if object is EmptySectionModel {
//            return EmptySectionController()
//        }
//        return SATextFieldSectionController(delegate: model.delegate, scrollDelegate: self)
        if object is LabelSectionModel {
            return LabelSectionController()
        }
        return RegistrationFormContinueSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension RegistrationFoamSectionFactory: RegistrationFoamAutoScrollDelegate {
    func scrollTo(model: ListDiffable) {
        adapter.scroll(to: model, supplementaryKinds: nil, scrollDirection: .vertical, scrollPosition: .top, animated: false)
    }
}
