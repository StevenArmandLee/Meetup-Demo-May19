//
//  RegistrationFoamVerticalSectionController.swift
//  IGListKitDemo
//
//  Created by steven lee on 2/4/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit

final class RegistrationFoamVerticalSectionModel: NSObject {
    let data: RegistrationFoamSectionFactoryModel
    let collectionViewHeight: CGFloat
    init(data: RegistrationFoamSectionFactoryModel, collectionViewHeight: CGFloat) {
        self.data = data
        self.collectionViewHeight = collectionViewHeight
    }
}

final class RegistrationFoamVerticalSectionController: ListSectionController, ListAdapterDataSource {
    
    private var model: RegistrationFoamVerticalSectionModel!
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        
        adapter.dataSource = self
        return adapter
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: model.collectionViewHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: EmbeddedCollectionViewCell.self,
                                                                for: self,
                                                                at: index) as? EmbeddedCollectionViewCell else {
                                                                    fatalError()
        }
        cell.collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        cell.collectionView.isPagingEnabled = true
        cell.collectionView.alwaysBounceVertical = false
        cell.collectionView.alwaysBounceHorizontal = false
        cell.collectionView.bounces = false
        cell.collectionView.showsHorizontalScrollIndicator = false
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = (object as! RegistrationFoamVerticalSectionModel)
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [model.data]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        let sc = RegistrationFoamSectionFactory()
        return sc
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

