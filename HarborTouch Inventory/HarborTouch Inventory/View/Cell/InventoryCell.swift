//
//  InventoryCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/27/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class InventoryCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    var inventory: InventoryEntity! {
        didSet {
            titleLabel.text = inventory.valueForKey("itemName") as? String
            descriptionLabel.text = inventory.valueForKey("itemShortName") as? String
        }
    }
}
