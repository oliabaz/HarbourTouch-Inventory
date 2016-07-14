//
//  DepartmentCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/14/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class DepartmentCell: UITableViewCell {

    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var arrowImage: UIImageView!
    @IBOutlet private weak var buttonSwitch: UISwitch!
    
    var title: String? {
        didSet {
            titleLabel.text = title
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
