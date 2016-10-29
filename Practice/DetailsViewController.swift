//
//  DetailsViewController.swift
//  Practice
//
//  Created by paul on 29/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailsViewController.goBack))
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    @objc fileprivate func goBack(){
        dismiss(animated: true, completion: nil)
    }


}
