//
//  RequestModal.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/20/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Alamofire

class RequestModel {
    
    static func requestDescription(barCode: Int, complitionHandler: ([String]) -> Void ) {
        var result = [String]()
        Alamofire.request(.GET, Constants.barCodeUrl + Constants.barCodes[barCode]).responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                return
            }
            let value = response.result.value as? [String: AnyObject]
            result = value!["items"] as! [String]
            complitionHandler(result)
        }
    }
}
