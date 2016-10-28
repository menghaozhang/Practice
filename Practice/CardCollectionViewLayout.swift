//
//  CardCollectionViewLayout.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 For future usage. If there is a need for different layout or item size
 */
final class CardCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 200, height: 200)
    }
}
