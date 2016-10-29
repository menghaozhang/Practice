//
//  Helper.swift
//  Practice
//
//  Created by paul on 29/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import UIKit
/**
 Helper class for get the current orientation
 */
final class Helper {
    
    static let sharedInstance = Helper()
    
    private struct Constants {
        static let compactCellWidth: CGFloat = 150
        static let compactCellHeight: CGFloat = 150
        static let regularCellWidth: CGFloat = 200
        static let regularCellHeight: CGFloat = 200
    }
    
    internal var traitCollection: UITraitCollection?
    
    internal func updateTraitCollection(traitCollection: UITraitCollection) {
        self.traitCollection = traitCollection
    }
    
    internal func itemSize() -> CGSize {
        if traitCollection != nil {
            if isSizeClassVerticalCompact(traitCollection: traitCollection!) {
                return CGSize(width: Constants.regularCellWidth, height: Constants.regularCellHeight)
            }
            return CGSize(width: Constants.compactCellWidth, height: Constants.compactCellHeight)
        }
        return CGSize(width: Constants.compactCellWidth, height: Constants.compactCellHeight)
    }
    
    ///Device type iPhone in landscape orientation
    fileprivate func isSizeClassVerticalCompact(traitCollection: UITraitCollection) -> Bool {
        return traitCollection.containsTraits(in: UITraitCollection(traitsFrom: [UITraitCollection(verticalSizeClass: .compact)]))
    }
}
