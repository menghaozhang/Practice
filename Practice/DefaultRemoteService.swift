//
//  DefaultRemoteService.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import Alamofire
import Gloss

final class DefaultRemoteService: RemoteService {
    func getData(_ completion: @escaping ([Entry]?, NSError?) -> Void) {
        if let urlString = Configuration.sharedInstance.DataEndPoint() {
            Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if let data = response.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
                        let entry = Content(json: json)?.playlist?.a
                        completion(entry, nil)
                        
                    } catch let error as NSError {
                        completion(nil, error)
                    }
                }
            }
        }else {
            completion(nil, NSError(domain: "EmptyURL", code: 001))
        }
    }
}
