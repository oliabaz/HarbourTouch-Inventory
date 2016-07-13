//
//  MenuViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/12/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    @IBOutlet var logOutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Menu"
        logOutButton.setBackgroundImage(UIImage(named: "skipBtn"), forState: .Normal, barMetrics: .Default)
        logOutButton.setTitleTextAttributes([NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 15))!], forState: .Normal)
    }

    @IBAction func onLogOut() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
