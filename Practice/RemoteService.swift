//
//  RemoteService.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//
import Foundation

protocol RemoteService {
    func getData(_ completion: @escaping (_ response: [Entry]?, _ error: NSError?) -> Void)
}
