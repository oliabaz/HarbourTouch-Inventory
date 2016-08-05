//
//  Inventory.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/28/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation
import CoreData

class InventoryEntity: NSManagedObject {

    @NSManaged var active: NSNumber?
    @NSManaged var color: String?
    @NSManaged var cost: NSNumber?
    @NSManaged var createdAt: String?
    @NSManaged var departmentId: NSNumber?
    @NSManaged var deptOpenKey: NSNumber?
    @NSManaged var ebtItem: NSNumber?
    @NSManaged var glyph: String?
    @NSManaged var id: NSNumber?
    @NSManaged var inheritTaxes: NSNumber?
    @NSManaged var isGift: NSNumber?
    @NSManaged var isSync: NSNumber?
    @NSManaged var itemName: String?
    @NSManaged var itemNotes: String?
    @NSManaged var itemShortName: String?
    @NSManaged var itemTags: String?
    @NSManaged var locationId: NSNumber?
    @NSManaged var lookup: String?
    @NSManaged var minQty: NSNumber?
    @NSManaged var openItem: NSNumber?
    @NSManaged var price: NSNumber?
    @NSManaged var printItem: NSNumber?
    @NSManaged var qtyOnHand: NSNumber?
    @NSManaged var tareWeight: NSNumber?
    @NSManaged var unit: String?
    @NSManaged var updatedAt: String?
    @NSManaged var usesWeightScale: NSNumber?
    @NSManaged var weighted: NSNumber?
    
    var inventoryItem: [String: AnyObject?]? {
        didSet {
            active = inventoryItem?["active"] as? NSNumber
            color = inventoryItem?["color"] as? String
            cost = inventoryItem?["cost"] as? NSNumber
            createdAt = inventoryItem?["createdAt"] as? String
            departmentId = inventoryItem?["departmentId"] as? NSNumber
            deptOpenKey = inventoryItem?["deptOpenKey"] as? NSNumber
            ebtItem = inventoryItem?["ebtItem"] as? NSNumber
            glyph = inventoryItem?["glyph"] as? String
            id = inventoryItem?["id"] as? NSNumber
            inheritTaxes = inventoryItem?["inheritTaxes"] as? NSNumber
            isGift = inventoryItem?["isGift"] as? NSNumber
            isSync = 1
            itemName = inventoryItem?["itemName"] as? String
            itemNotes = inventoryItem?["itemNotes"] as? String
            itemShortName = inventoryItem?["itemShortName"] as? String
            itemTags = inventoryItem?["itemTags"] as? String
            locationId = inventoryItem?["locationId"] as? NSNumber
            lookup = inventoryItem?["lookup"] as? String
            minQty = inventoryItem?["minQty"] as? NSNumber
            openItem = inventoryItem?["openItem"] as? NSNumber
            price = inventoryItem?["price"] as? NSNumber
            printItem = inventoryItem?["printItem"] as? NSNumber
            qtyOnHand = inventoryItem?["qtyOnHand"] as? NSNumber
            tareWeight = inventoryItem?["tareWeight"] as? NSNumber
            unit = inventoryItem?["unit"] as? String
            updatedAt = inventoryItem?["updatedAt"] as? String
            usesWeightScale = inventoryItem?["usesWeightScale"] as? NSNumber
            weighted = inventoryItem?["weighted"] as? NSNumber
        }
    }
}
