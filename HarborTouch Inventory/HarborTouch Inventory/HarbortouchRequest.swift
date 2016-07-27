//
//  HarbortouchRequest.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/26/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Alamofire
import CoreData

class HarbortouchRequest {
    
    static func requestDescription() {
        var items = [NSManagedObject]()
        Alamofire.request(.GET, Constants.kApiUrl + Constants.kApiPrefix + Constants.kApiItems, headers: ["X-Access-Token": Constants.kUserToken]).responseJSON {
            (response) -> Void in
            guard response.result.isSuccess else {
                return
            }
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Inventory", inManagedObjectContext: managedContext)
            let inventory = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            let values = response.result.value as! [[String: AnyObject?]]
            for item in values {
                for (key, value) in item {
                    if value == nil {
                        print("Value is nil")
                    }
                    inventory.setValue(value, forKey: key)
                    do {
                        try managedContext.save()
                        items.append(inventory)
                    } catch let error as NSError {
                        print("Could not save \(error)")
                    }
                }
            }
        }
    }
    
}
