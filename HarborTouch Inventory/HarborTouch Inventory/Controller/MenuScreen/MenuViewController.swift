//
//  MenuViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/12/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Menu"
    }

    @IBAction func onLogOut() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
