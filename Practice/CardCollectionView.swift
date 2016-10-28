//
//  CardCollectionView.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Collection View
 */
final class CardCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    private struct Constants {
        static let className = "CardCollectionViewCell"
        static let reuseId = "card_reuse_id"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(UINib(nibName: Constants.className, bundle: nil), forCellWithReuseIdentifier: Constants.reuseId)
    }
}
