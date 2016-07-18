//
//  StoreCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/15/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

enum Type: String {
    case arrow = "arrow", toggle = "toggle", none = "none"

}

class StoreCell: UITableViewCell {
    
    let high: CGFloat = 0.0
    let width: CGFloat = 0.0
    var type: String?
    
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
            type = storeItem!["type"]!
            setupType()
            setupLabels()
        }
    }
    
    func setupLabels() {
        if cellImage.image == nil {
            widthConstraint.constant = width
        }
        if subtitleLabel.text == "" {
            highConstraint.constant = high
        }
        
    }
    
    func setupType() {
        switch Type(rawValue: type!)! {
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
