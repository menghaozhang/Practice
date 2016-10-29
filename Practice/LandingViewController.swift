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

    private var cardCollectionView: CardCollectionView?
    private let cardCollectionViewDataManager = CardCollectionViewDataManager()
    private let cardCollectionViewLayout = CardCollectionViewLayout()
    private let remoteSerivce = DefaultRemoteService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.sharedInstance.setUp(self.navigationController!)
        fetchDataFromRemote()
    }
    
    private func fetchDataFromRemote() {
        remoteSerivce.getData { [unowned self] (entries, error) in
            if error == nil {
                self.cardCollectionViewDataManager.a = entries
                self.cleanUpGame()
                self.setUpGame()
            }else {
                let alert = UIAlertController(title: "Alert", message: error?.domain, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default, handler: { [weak self](alertAction) in
                    self?.fetchDataFromRemote()
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
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
            topLayoutGuide.bottomAnchor.constraint(equalTo: cv.topAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: cv.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: cv.trailingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: cv.bottomAnchor).isActive = true
        }
    }
}

