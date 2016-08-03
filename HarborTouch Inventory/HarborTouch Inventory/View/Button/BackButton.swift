//
//  MenuButton.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/14/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class BackButton: UIBarButtonItem {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setBackgroundImage(UIImage(named: "backButton"), forState: .Normal, style: .Plain, barMetrics: .Default)
        self.setTitleTextAttributes([NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 15))!], forState: .Normal)
    }
}
