//
//  InventoryDetailsCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/2/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

enum InventoryDetailsType: String {
    case toggle = "toggle", none = "none"
}

class InventoryDetailsCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var buttonSwitch: UISwitch!
    
    var cellType: InventoryDetailsType!

    var inventoryItem: [String: AnyObject?]? {
        didSet {
            let value = inventoryItem!["value"]!
            keyLabel.text = inventoryItem!["key"] as? String
            if value is NSNumber {
                valueLabel.text? = value!.stringValue
                buttonSwitch.on = value as! Bool
            } else {
                valueLabel.text = value as? String
            }
            cellType = InventoryDetailsType(rawValue: (inventoryItem!["type"]! as? String)!)
            setupType(cellType)
        }
    }
    
    func setupType(type: InventoryDetailsType) {
        switch type {
        case .toggle:
            buttonSwitch.hidden = false
            valueLabel.hidden = true
        case .none:
            buttonSwitch.hidden = true
            valueLabel.hidden = false
        }
    }
}
