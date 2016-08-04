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
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Inventory Details"
        setupKeyboardNotifications()
    }
    
    override func adjustingHeight(show: Bool, notification: NSNotification) {
//        if show {
//            tableView.frame.size.height = tableView.frame.height - (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
//        } else {
//            tableView.frame.size.height = tableView.frame.height + (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
//        }
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
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}

    // MARK: - InventoryDetailsCellDelegate
extension InventoryDetailsViewController: InventoryDetailsCellDelegate {
    
    func inventoryDetailsCellNextTextField(indexCurrentCell: Int) {
        let indexNextCell = sourceData.findNextTextField(indexCurrentCell, inventory: inventory)
        let indexPath = NSIndexPath(forRow: indexNextCell, inSection: 0)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! InventoryDetailsCell
        cell.textField.becomeFirstResponder()
    }
}