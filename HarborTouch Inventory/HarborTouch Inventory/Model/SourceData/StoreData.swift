//
//  StoreData.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/15/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import Foundation

enum StoreItems: Int {
    case departments = 0, vendors, taxes, cost, lookup, clear, restore
    
    static var itemsCount: Int = {
        var max: Int = 0
        while let _ = StoreItems(rawValue: max) { max += 1 }
        return max
    }()
}
enum StoreItems2: Int {
    case departments = 0, vendors
    
    static var itemsCount2: Int = {
        var max: Int = 0
        while let _ = StoreItems2(rawValue: max) { max += 1 }
        return max
    }()
}

class StoreData {
    
    func storeItemForIndex(index: Int) -> [String: String] {
        switch StoreItems(rawValue: index)! {
        case .departments:
            return ["title": "Departments",
                    "subtitle": "15 configured",
                    "icon": "dept",
                    "type": "arrow"]
        case .vendors:
            return ["title": "Vendors",
                    "subtitle": "0 configured",
                    "icon": "vendors",
                    "type": "arrow"]
        case .taxes:
            return ["title": "Taxes",
                    "subtitle": "12 configured",
                    "icon": "taxes",
                    "type": "arrow"]
        case .cost:
            return ["title": "Cost Tracing",
                    "icon": "cost",
                    "type": "toggle"]
        case .lookup:
            return ["title": "Look up item description",
                    "icon": "lookup",
                    "type": "toggle"]
        case .clear:
            return ["title": "Clear Inventory",
                    "subtitle": "0 configured",
                    "type": "none"]
        case .restore:
            return ["title": "Restore from back up",
                    "type": "none"]
        }
    }
    
    func storeItemForIndex2(index: Int) -> [String: String] {
        switch StoreItems2(rawValue: index)! {
        case .departments:
            return ["title": "Departments",
                    "subtitle": "15 configured",
                    "icon": "dept",
                    "type": "arrow"]
        case .vendors:
            return ["title": "Vendors",
                    "subtitle": "0 configured",
                    "icon": "vendors",
                    "type": "arrow"]
        }
    }
}