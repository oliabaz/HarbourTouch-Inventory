//
//  SourceData.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/3/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation

enum InventoryDetails: Int {
    case active = 0, color, cost, deptOpenKey, ebtItem, glyph, inheritTaxes, isGift, itemName, itemNotes, itemShortName, itemTags, lookup, minQty, openItem, price, printItem, qtyOnHand, tareWeight, unit,usesWeightScale, weighted
    
    static var itemsCount: Int = {
        var max: Int = 0
        while let _ = InventoryDetails(rawValue: max) { max += 1 }
        return max
    }()
}

class SourceData {
    
    func findNextTextField(indexCurrentTextField: Int, inventory: InventoryEntity) -> Int {
        var indexNextTextField = indexCurrentTextField
        var type: String
        repeat {
            indexNextTextField += 1
            type = self.inventoryDetailsForIndex(indexNextTextField, inventory: inventory)["type"] as! String
        } while type != "none"
        return indexNextTextField
    }
    
    static func inventoryForNewItem() -> [String: AnyObject?] {
        return ["active": 0, "color": "", "cost": nil, "deptOpenKey": 0, "ebtItem": 0, "glyph": "", "inheritTaxes": 0, "isGift": 0, "itemName": "", "itemNotes": "", "itemShortName": "", "itemTags": "", "lookup": "", "minQty": nil, "openItem": 0, "price": nil, "printItem": 0, "qtyOnHand": nil, "tareWeight": 0, "unit": "", "usesWeightScale": 0, "weighted": 0]
    }
    
    func inventoryDetailsForIndex(index: Int, inventory: InventoryEntity) -> [String: AnyObject?] {
        switch InventoryDetails(rawValue: index)! {
        case .active:
            return ["key": "Active",
                    "value": inventory.active,
                    "type": "toggle"]
        case .color:
            return ["key": "Color",
                    "value": inventory.color,
                    "type": "none"]
        case .cost:
            return ["key": "Cost",
                    "value": inventory.cost,
                    "type": "none"]

        case .deptOpenKey:
            return ["key": "CeptOpenKey",
                    "value": inventory.deptOpenKey,
                    "type": "toggle"]

        case .ebtItem:
            return ["key": "EbtItem",
                    "value": inventory.ebtItem,
                    "type": "toggle"]

        case .glyph:
            return ["key": "Glyph",
                    "value": inventory.glyph,
                    "type": "none"]

        case .inheritTaxes:
            return ["key": "InheritTaxes",
                    "value": inventory.inheritTaxes,
                    "type": "toggle"]

        case .isGift:
            return ["key": "IsGift",
                    "value": inventory.isGift,
                    "type": "toggle"]

        case .itemName:
            return ["key": "ItemName",
                    "value": inventory.itemName,
                    "type": "none"]

        case .itemNotes:
            return ["key": "ItemNotes",
                    "value": inventory.itemNotes,
                    "type": "none"]

        case .itemShortName:
            return ["key": "ItemShortName",
                    "value": inventory.itemShortName,
                    "type": "none"]

        case .itemTags:
            return ["key": "ItemTags",
                    "value": inventory.itemTags,
                    "type": "none"]

        case .lookup:
            return ["key": "Lookup",
                    "value": inventory.lookup,
                    "type": "none"]

        case .minQty:
            return ["key": "MinQty",
                    "value": inventory.minQty,
                    "type": "none"]

        case .openItem:
            return ["key": "OpenItem",
                    "value": inventory.openItem,
                    "type": "toggle"]

        case .price:
            return ["key": "Price",
                    "value": inventory.price,
                    "type": "none"]

        case .printItem:
            return ["key": "PrintItem",
                    "value": inventory.printItem,
                    "type": "toggle"]

        case .qtyOnHand:
            return ["key": "QtyOnHand",
                    "value": inventory.qtyOnHand,
                    "type": "none"]

        case .tareWeight:
            return ["key": "TareWeight",
                    "value": inventory.tareWeight,
                    "type": "toggle"]

        case .unit:
            return ["key": "Unit",
                    "value": inventory.unit,
                    "type": "none"]

        case .usesWeightScale:
            return ["key": "UsesWeightScale",
                    "value": inventory.usesWeightScale,
                    "type": "toggle"]

        case .weighted:
            return ["key": "Weighted",
                    "value": inventory.weighted,
                    "type": "toggle"]
        }
    }
}