//
//  Configuration.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//
import Foundation
/**
 Configuration for get the remote URL
 */
final class Configuration {
    static let sharedInstance = Configuration()
    private var dataEndPoint: String?
    
    internal func DataEndPoint() -> String? {
        if dataEndPoint == nil {
            dataEndPoint = Bundle.main.object(forInfoDictionaryKey: "DataEndPoint") as? String
        }
        return dataEndPoint
    }
}
