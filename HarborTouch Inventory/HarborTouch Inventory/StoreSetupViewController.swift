
//  StoreSetupViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/13/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class StoreSetupViewController: BaseViewController {
    

    @IBOutlet weak var storeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Store Setup"
    }
}

extension StoreSetupViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DepartmentCell") as! DepartmentCell
        cell.title = String(indexPath.row)
        cell.backgroundView = tableView       
        return cell
    }
}

extension StoreSetupViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
}
