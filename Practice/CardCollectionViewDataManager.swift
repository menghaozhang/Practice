//
//  CardCollectionViewDataManager.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Data source and delegate for game view
 */
final class CardCollectionViewDataManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    internal var a: [Entry]?
    private let PlaceHolderImage = UIImage(named: "placeHolder")
    
    private struct Constants {
        static let numberOfSections = 1
        static let messageViewAutoDismissDuration: Double = 1
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return a?.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card_reuse_id", for: indexPath) as! CardCollectionViewCell
        cell.titleLabel.text = a?[indexPath.item].title ?? "No title"
        cell.artistLabel.text = a?[indexPath.item].artist ?? "No artist"
        cell.coverImageView.image = PlaceHolderImage
        cell.coverImageView.setImageOrPlaceholder(a?[indexPath.item].image ?? "", placeholder: "placeHolder")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        if let entry = a?[indexPath.item] {
            viewController?.item = entry
            NavigationHelper.sharedInstance.navTo(viewController!)
        }
    }
}
