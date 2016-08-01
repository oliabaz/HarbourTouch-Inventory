//
//  InventoryCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/27/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class InventoryCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var inventory: InventoryData! {
        didSet {
            titleLabel.text = inventory.valueForKey("itemName") as? String
            descriptionLabel.text = inventory.valueForKey("itemShortName") as? String
        }
    }

}
