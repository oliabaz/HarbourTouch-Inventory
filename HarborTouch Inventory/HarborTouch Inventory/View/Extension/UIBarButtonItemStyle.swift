//
//  UIBarButtonItemStyle.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/4/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    func applyDefaultStyle () {
        setTitleTextAttributes([NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 15))!], forState: .Normal)
        tintColor = UIColor.whiteColor()
        setBackgroundImage(UIImage(named: "bigBlueButton"), forState: .Normal, barMetrics: .Default)
    }
}