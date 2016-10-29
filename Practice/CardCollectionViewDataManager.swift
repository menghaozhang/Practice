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
    
    private struct Constants {
        static let numberOfSections = 1
        static let messageViewAutoDismissDuration: Double = 1
        static let fallBackTitle = "Unknow title"
        static let fallBackArtist = "Unknow Artist"
        static let placeHolder = "placeHolder"
        static let cardReuseId = "card_reuse_id"
    }
    
    internal var a: [Entry]?
    private let PlaceHolderImage = UIImage(named: Constants.placeHolder)
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return a?.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cardReuseId, for: indexPath) as! CardCollectionViewCell
        cell.titleLabel.text = a?[indexPath.item].title ?? Constants.fallBackTitle
        cell.artistLabel.text = a?[indexPath.item].artist ?? Constants.fallBackArtist
        cell.coverImageView.image = PlaceHolderImage
        cell.coverImageView.setImageOrPlaceholder(a?[indexPath.item].image ?? "", placeholder: Constants.placeHolder)
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
