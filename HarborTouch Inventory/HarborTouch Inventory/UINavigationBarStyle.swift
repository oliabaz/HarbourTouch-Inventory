//
//  UINavigationBarExtension.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/12/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    static func setNavBar() {
        appearance().setBackgroundImage(UIImage(named: "navBar"), forBarMetrics: .Default)
        appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 17))!]
        
    }
}
