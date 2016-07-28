//
//  InventoryListViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/26/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit
import CoreData

class InventoryListViewController: BaseTableController {
    
    var inventory = [InventoryData]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setupResizingCell()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension InventoryListViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("inventoryCell") as! InventoryCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
 
        return cell
    }
}
