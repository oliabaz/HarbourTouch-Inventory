//
//  UITableViewStyle.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/18/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setupCellBackground(indexPath: NSIndexPath) -> UIImageView {
        
        
        let numberOfRows = self.numberOfRowsInSection(indexPath.section)
        if numberOfRows == 1 {
            return UIImageView(image: UIImage(named: "singleCell"))
        } else {
            if indexPath.row == 0 {
                return UIImageView(image: UIImage(named: "cellTop"))
            }
            if indexPath.row == numberOfRows - 1 {
                return UIImageView(image: UIImage(named: "cellBottom"))
            } else {
                return UIImageView(image: UIImage(named: "cellMiddleBottom"))
            }
        }
        
    }
}
