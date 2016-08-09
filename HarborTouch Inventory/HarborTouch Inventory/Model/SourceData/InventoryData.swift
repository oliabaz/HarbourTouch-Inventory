//
//  InventoryData.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/1/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation

class InventoryData {
    
    var inventories: [InventoryEntity]!
    
    init() {
        inventories = CoreDataManager.fetchInventoryItems()
    }
    
    func itemForIndex(index: Int) -> InventoryEntity {        
        return inventories[index]
    }
    
    func count() -> Int {
        return inventories.count
    }
    
    func removeAtIndex(index: Int) {
        CoreDataManager.deleteInventoryItemAtRow(inventories[index])
        inventories = CoreDataManager.fetchInventoryItems()
    }
    
    func addInventory() {
        CoreDataManager.addInventoryItem()
        inventories = CoreDataManager.fetchInventoryItems()
    }
    
    func editNewInventoryItem() -> InventoryEntity {
        return inventories.last!
    }
    
    func deleteNewInventoryItem() {
        CoreDataManager.deleteInventoryItemAtRow(inventories.last!)
        inventories = CoreDataManager.fetchInventoryItems()
    }
    
    func saveInventoryItem(inventory: InventoryEntity, additionalInventory: AdditionalInventory) {
        CoreDataManager.saveInventoryItem(inventory, additionalInventory: additionalInventory)
    }
}