//
//  File.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class ChoiceButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setBackgroundImage(UIImage(named: "bigBlueButton"), forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
    }
}