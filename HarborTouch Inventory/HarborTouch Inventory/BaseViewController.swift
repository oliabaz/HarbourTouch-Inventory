//
//  BaseViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/13/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "viewBgr")
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    @IBAction func backAction() {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
