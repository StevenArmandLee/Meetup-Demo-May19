//
//  ListAdapterOwner.swift
//  IGListKitDemo
//
//  Created by steven lee on 13/3/19.
//  Copyright © 2019 steven lee. All rights reserved.
//

import Foundation
import IGListKit

protocol ListAdapterOwner: class {
    var collectionView: UICollectionView! {get}
    var adapter: ListAdapter! {get set}
}

class ListAdapterBuilder {
    static func buid(_ vc: UIViewController) {
        guard let owner = vc as? ListAdapterOwner,
            let dataSource = vc as? ListAdapterDataSource else {return}
        
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: vc)
        adapter.dataSource = dataSource
        adapter.collectionView = owner.collectionView
        owner.adapter = adapter
    }
}
