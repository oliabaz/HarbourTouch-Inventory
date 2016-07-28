//
//  RequestModal.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/20/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Alamofire

class RequestModel {
    
    static func requestDescription(barCode: Int, completionHandler: ([String]) -> Void ) {
        var result = [String]()
        Alamofire.request(.GET, Constants.barCodeUrl + Constants.barCodes[barCode]).responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                return
            }
            let value = response.result.value as? [String: AnyObject]
            result = value!["items"] as! [String]
            completionHandler(result)
        }
    }
    
    static func requestInventory(completionHandler: ([[String: AnyObject]]) -> Void) {
        Alamofire.request(.GET, Constants.kApiUrl + Constants.kApiPrefix + Constants.kApiItems, headers: ["X-Access-Token": Constants.kUserToken]).responseJSON {
            (response) -> Void in
            guard response.result.isSuccess else {
                return
            }
            let values = response.result.value as! [[String: AnyObject]]
            completionHandler(values)
        }
    }
}
