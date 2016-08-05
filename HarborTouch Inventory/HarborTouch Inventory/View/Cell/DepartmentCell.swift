//
//  DepartmentCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/20/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class DepartmentCell: UITableViewCell {

    @IBOutlet private weak var resultLabel: UILabel!

    var department: String? {
        didSet {
            resultLabel.text = department
        }
    }
}
