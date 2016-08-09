//
//  AdditionalInventory.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/8/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation

class AdditionalInventory {
    var active: NSNumber?
    var color: String?
    var cost: NSNumber?
    var createdAt: String?
    var departmentId: NSNumber?
    var deptOpenKey: NSNumber?
    var ebtItem: NSNumber?
    var glyph: String?
    var id: NSNumber?
    var inheritTaxes: NSNumber?
    var isGift: NSNumber?
    var isSync: NSNumber?
    var itemName: String?
    var itemNotes: String?
    var itemShortName: String?
    var itemTags: String?
    var locationId: NSNumber?
    var lookup: String?
    var minQty: NSNumber?
    var openItem: NSNumber?
    var price: NSNumber?
    var printItem: NSNumber?
    var qtyOnHand: NSNumber?
    var tareWeight: NSNumber?
    var unit: String?
    var updatedAt: String?
    var usesWeightScale: NSNumber?
    var weighted: NSNumber?
    
    init(inventory: InventoryEntity){
        self.active = inventory.active
        self.color = inventory.color
        self.cost = inventory.cost
        self.createdAt = inventory.createdAt
        self.departmentId = inventory.departmentId
        self.deptOpenKey = inventory.deptOpenKey
        self.ebtItem = inventory.ebtItem
        self.glyph = inventory.glyph
        self.id = inventory.id
        self.inheritTaxes = inventory.inheritTaxes
        self.isGift = inventory.isGift
        self.isSync = inventory.isSync
        self.itemName = inventory.itemName
        self.itemNotes = inventory.itemNotes
        self.itemShortName = inventory.itemShortName
        self.itemTags = inventory.itemTags
        self.locationId = inventory.locationId
        self.lookup = inventory.lookup
        self.minQty = inventory.minQty
        self.openItem = inventory.openItem
        self.price = inventory.price
        self.printItem = inventory.printItem
        self.qtyOnHand = inventory.qtyOnHand
        self.tareWeight = inventory.tareWeight
        self.unit = inventory.unit
        self.updatedAt = inventory.updatedAt
        self.usesWeightScale = inventory.usesWeightScale
        self.weighted = inventory.weighted
    }
    
    func setupCurrentValue() -> [String: AnyObject?]{
        var inventory = [String: AnyObject?]()
        inventory["active"] = self.active
        inventory["color"] = self.color
        inventory["cost"] = self.cost
        inventory["deptOpenKey"] = self.deptOpenKey
        inventory["ebtItem"] = self.ebtItem
        inventory["glyph"] = self.glyph
        inventory["inheritTaxes"] = self.inheritTaxes
        inventory["isGift"] = self.isGift
        inventory["isSync"] = self.isSync
        inventory["itemName"] = self.itemName
        inventory["itemNotes"] = self.itemNotes
        inventory["itemShortName"] = self.itemShortName
        inventory["itemTags"] = self.itemTags
        inventory["lookup"] = self.lookup
        inventory["minQty"] = self.minQty
        inventory["openItem"] = self.openItem
        inventory["price"] = self.price
        inventory["printItem"] = self.printItem
        inventory["qtyOnHand"] = self.qtyOnHand
        inventory["tareWeight"] = self.tareWeight
        inventory["unit"] = self.unit
        inventory["usesWeightScale"] = self.usesWeightScale
        inventory["weighted"] = self.weighted
        return inventory
    }
}
