//
//  NavHelper.swift
//  Practice
//
//  Created by paul on 29/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit

final class NavigationHelper: NSObject {
    
    private struct Constants{
        static let backText = "Back"
    }
    
    static let sharedInstance = NavigationHelper()
    
    private var navController: UINavigationController!
    private var detailsViewController: UIViewController?
    
    internal func getNavigationController() -> UINavigationController {
        return navController
    }
    
    internal func setUp(_ rootViewController: UINavigationController) {
        navController = rootViewController
    }
    
    internal func navTo(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navController.present(navigationController, animated: true)
        detailsViewController = viewController
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constants.backText, style: UIBarButtonItemStyle.plain, target: self, action: #selector(NavigationHelper.goBack))
    }
    
    @objc fileprivate func goBack() {
        if let viewController = detailsViewController {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
}
