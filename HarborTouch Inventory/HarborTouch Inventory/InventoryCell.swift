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
    
    var result: Inventory! {
        didSet {
            titleLabel.text = result.valueForKey("itemName") as? String
            descriptionLabel.text = result.valueForKey("itemShortName") as? String
        }
    }

}
