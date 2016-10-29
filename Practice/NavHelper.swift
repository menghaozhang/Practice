//
//  NavHelper.swift
//  Practice
//
//  Created by paul on 29/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit

final class NavigationHelper: NSObject {
    
    static let sharedInstance = NavigationHelper()
    
    private var navController: UINavigationController!
    
    internal func getNavigationController() -> UINavigationController {
        return navController
    }
    
    internal func setUp(_ rootViewController: UINavigationController) {
        navController = rootViewController
    }
}
