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
    
    
    internal var item: Entry! {
        didSet {
            detailImageView?.setImageOrPlaceholder(item.image ?? "", placeholder: "placeHolder")
            titleLabel?.text = item.title ?? "No title"
            artistLabel?.text = item.artist ?? "No artist"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView?.setImageOrPlaceholder(item.image ?? "", placeholder: "placeHolder")
        titleLabel?.text = item.title ?? "No title"
        artistLabel?.text = item.artist ?? "No artist"
    }

}
