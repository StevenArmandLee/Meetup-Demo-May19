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
        if let object = object as? ListBoundable {
            return object.boundedSectionController()
        }
        return RegistrationFormTextFieldSectionController(scrollDelegate: self)
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
