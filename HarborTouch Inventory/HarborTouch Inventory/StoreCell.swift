//
//  StoreCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/15/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {
    
    let const = 56
    
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var arrowImage: UIImageView!
    @IBOutlet private weak var buttonSwitch: UISwitch!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var highConstraint: NSLayoutConstraint!
    
    var storeItem : [String: String]? {
        didSet {
            titleLabel.text = storeItem!["title"]
            subtitleLabel.text = storeItem!["subtitle"]
            cellImage.image = UIImage(named: storeItem!["icon"]!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
