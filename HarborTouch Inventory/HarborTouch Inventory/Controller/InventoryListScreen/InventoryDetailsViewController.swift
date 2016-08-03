//
//  InventoryDetailsViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/1/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class InventoryDetailsViewController: BaseViewController {
    
    var inventory: InventoryEntity!
    let sourceData = SourceData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Inventory Details"
    }
}
    // MARK: - UITableViewDataSource
extension InventoryDetailsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InventoryDetails.itemsCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("inventoryDetailCell") as! InventoryDetailsCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
        cell.inventoryItem = sourceData.inventoryDetailsForIndex(indexPath.row, inventory: inventory)
        return cell
    }
}