//
//  CoreDataManager.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/1/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation
import MagicalRecord

class CoreDataManager {
    
    static func saveInventoryItems(inventories: [[String: AnyObject]]) {
        CoreDataManager.deleteSyncInventoryItems()
        for inventory in inventories {
            let inventoryEntity = InventoryEntity.MR_createEntity()! as InventoryEntity
            inventoryEntity.inventoryItem = inventory
        }
        saveContext()
    }
    
    static func deleteSyncInventoryItems() {
        let inventories = CoreDataManager.fetchSyncInventoryItems()
        for inventory in inventories {
            inventory.MR_deleteEntity()
        }
        saveContext()
    }
    
    static func deleteInventoryItemAtRow(inventory: InventoryEntity) {
        inventory.MR_deleteEntity()
        saveContext()
    }

    static func saveContext() {
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }
    
    static func fetchInventoryItems() -> [InventoryEntity] {
        var inventories: [InventoryEntity]
        inventories = InventoryEntity.MR_findAll() as! [InventoryEntity]
        return inventories
    }
    
    static func fetchSyncInventoryItems() -> [InventoryEntity] {
        var inventories: [InventoryEntity]
        inventories = InventoryEntity.MR_findByAttribute("isSync", withValue: 1) as! [InventoryEntity]
        return inventories
    }
    
    static func addInventoryItem() {
        let inventoryEntity = InventoryEntity.MR_createEntity()! as InventoryEntity
        inventoryEntity.inventoryItem = SourceData.inventoryForNewItem()
        saveContext()
    }
    
    static func saveInventoryItem(inventory: InventoryEntity, additionalInventory: AdditionalInventory) {
        inventory.inventoryItem = additionalInventory.setupCurrentValue()
        saveContext()
    }
}