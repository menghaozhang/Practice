//
//  ViewController.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 The ViewController for landing screen
 */
final class LandingViewController: UIViewController {

    private var collectionView: CardCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpGame()
    }
    
    private func cleanUpGame() {
        if collectionView != nil {
            collectionView?.removeFromSuperview()
        }
    }
    
    private func setUpGame() {
        collectionView = CardCollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView!)
    }
}

