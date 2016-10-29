//
//  Configuration.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//
import Foundation
import AlamofireImage
/**
 Configuration for get the remote URL
 */
final class Configuration {
    static let sharedInstance = Configuration()
    
    private var dataEndPoint: String?
    internal var imageCache = AutoPurgingImageCache(
        memoryCapacity: 60 * 1024 * 1024,
        preferredMemoryUsageAfterPurge: 20 * 1024 * 1024
    )
    
    internal func DataEndPoint() -> String? {
        if dataEndPoint == nil {
            dataEndPoint = Bundle.main.object(forInfoDictionaryKey: "DataEndPoint") as? String
        }
        return dataEndPoint
    }
}
