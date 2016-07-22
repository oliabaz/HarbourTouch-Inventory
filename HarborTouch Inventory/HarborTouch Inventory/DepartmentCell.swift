//
//  DepartmentCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/20/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class DepartmentCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!

    var result: String? {
        didSet {
            resultLabel.text = result
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
