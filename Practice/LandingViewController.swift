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
    @IBOutlet weak var headerView: UIView!

    private var cardCollectionView: CardCollectionView?
    private let cardCollectionViewDataManager = CardCollectionViewDataManager()
    private let cardCollectionViewLayout = CardCollectionViewLayout()
    private let remoteSerivce = DefaultRemoteService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remoteSerivce.getData { [unowned self] (entries, error) in
            if error == nil {
                self.cardCollectionViewDataManager.a = entries
                self.cleanUpGame()
                self.setUpGame()
            }else {
                // handle Error
            }
        }
        
        
    }
    
    private func cleanUpGame() {
        if cardCollectionView != nil {
            cardCollectionView?.removeFromSuperview()
        }
    }
    
    private func setUpGame() {
        cardCollectionView = CardCollectionView(frame: CGRect.zero, collectionViewLayout: cardCollectionViewLayout)
        view.addSubview(cardCollectionView!)
        
        cardCollectionView?.dataSource = cardCollectionViewDataManager
        cardCollectionView?.delegate = cardCollectionViewDataManager
        cardCollectionView?.backgroundColor = .white
        
        layoutCardView()
    }
    
    private func layoutCardView() {
        if let cv = cardCollectionView {
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: cv.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: cv.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: cv.bottomAnchor).isActive = true
        }
    }
}

