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
        
        setupRightButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "1", style: .Plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem?.setBackgroundImage(UIImage(named: "backButton"), forState: .Normal, style: .Plain, barMetrics: .Default)
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 15))!, NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
    }
    
    func backAction() {
        navigationController?.popViewControllerAnimated(true)
    }

    func setupRightButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "question")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: nil)
    }

}
