//
//  Inventory.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/28/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

class InventoryData: NSManagedObject {

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
    
    func saveInventoryItems(inventory: [String: AnyObject]) {


        saveContext()
    }
    
    func fetchInventoryItems() -> [InventoryData] {
        var inventories: [InventoryData]!
        inventories = InventoryData.MR_findAll() as! [InventoryData]
        return inventories
    }
    
    func deleteInventoryItems() {
        let inventories = fetchInventoryItems()
        for inventory in inventories {
            inventory.MR_deleteEntity()
        }
        saveContext()
    }
    
    func saveContext() {
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }

}
