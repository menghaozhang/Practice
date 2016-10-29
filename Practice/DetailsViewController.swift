//
//  DetailsViewController.swift
//  Practice
//
//  Created by paul on 29/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Detail view
 */
final class DetailsViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    private struct Constants {
        static let fallBackTitle = "Unknow title"
        static let fallBackArtist = "Unknow Artist"
        static let placeHolder = "placeHolder"
    }
    
    internal var item: Entry! {
        didSet {
            detailImageView?.setImageOrPlaceholder(item.image ?? "", placeholder: Constants.placeHolder)
            titleLabel?.text = item.title ?? Constants.fallBackTitle
            artistLabel?.text = item.artist ?? Constants.fallBackArtist
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = item.title ?? Constants.fallBackTitle
        detailImageView?.setImageOrPlaceholder(item.image ?? "", placeholder: Constants.placeHolder)
        titleLabel?.text = item.title ?? Constants.fallBackTitle
        artistLabel?.text = item.artist ?? Constants.fallBackArtist
    }

}
