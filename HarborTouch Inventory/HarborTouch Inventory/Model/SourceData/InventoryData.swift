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
        CoreDataManager.deleteInventoryAtRow(inventories[index])
        inventories = CoreDataManager.fetchInventoryItems()
    }
    
    func addInventory() {
        CoreDataManager.addInventory()
        inventories = CoreDataManager.fetchInventoryItems()
    }
}