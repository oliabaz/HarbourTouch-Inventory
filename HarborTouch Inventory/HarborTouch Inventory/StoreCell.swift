//
//  StoreCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/15/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

enum StoreCellType: String {
    case arrow = "arrow", toggle = "toggle", none = "none"

}

class StoreCell: UITableViewCell {
    
    let hiddenLabelHigh: CGFloat = 0.0
    let hiddenImageWidth: CGFloat = 0.0
    let labelHigh: CGFloat = 19.0
    let imageWidth: CGFloat = 46.0
    var cellType: StoreCellType!
    
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var arrowImage: UIImageView!
    @IBOutlet private weak var buttonSwitch: UISwitch!
    @IBOutlet private weak var imageWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var labelHighConstraint: NSLayoutConstraint!
        
    var storeItem : [String: String]? {
        didSet {
            titleLabel.text = storeItem?["title"]
            subtitleLabel.text = storeItem?["subtitle"]
            if let icon = storeItem?["icon"] {
                cellImage.image = UIImage(named: icon)
            } else {
                cellImage.image = nil
            }
            cellType = StoreCellType(rawValue: storeItem!["type"]!)
            setupType(cellType)
            setupLabels()
        }
    }
    
    
    func setupLabels() {
        if cellImage.image == nil {
            imageWidthConstraint.constant = hiddenImageWidth
        } else {
            imageWidthConstraint.constant = imageWidth
        }
        if subtitleLabel.text == nil {
            labelHighConstraint.constant = hiddenLabelHigh
        } else {
            labelHighConstraint.constant = labelHigh
        }
        
    }
    
    func setupType(type: StoreCellType) {
        switch type {
        case .arrow:
            arrowImage.hidden = false
            buttonSwitch.hidden = true
        case .toggle:
            arrowImage.hidden = true
            buttonSwitch.hidden = false
        case .none:
            arrowImage.hidden = true
            buttonSwitch.hidden = true
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
