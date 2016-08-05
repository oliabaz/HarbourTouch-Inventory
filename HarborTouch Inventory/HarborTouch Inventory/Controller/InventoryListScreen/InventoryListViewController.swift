//
//  InventoryListViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/26/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class InventoryListViewController: BaseViewController {
    
    var inventory = InventoryData()
    var editInventory: InventoryEntity!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Inventory List"
        tableView.setupResizingCell()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "inventoryDetails" {
            let destinationVC = segue.destinationViewController as! InventoryDetailsViewController
            destinationVC.inventory = editInventory
            destinationVC.delegate = self
        }
    }
    
    // MARK: - Actions
    @IBAction func onAddAction(sender: AnyObject) {
        inventory.addInventory()
        editInventory = inventory.editNewInventoryItem()
        self.performSegueWithIdentifier("inventoryDetails", sender: self)
    }
}
    // MARK: - UITableViewDataSource
extension InventoryListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("inventoryCell") as! InventoryCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
        cell.inventory = inventory.itemForIndex(indexPath.row)
        return cell
    }
}
    // MARK: - UITableViewDelegate
extension InventoryListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        editInventory = inventory.itemForIndex(indexPath.row)
        self.performSegueWithIdentifier("inventoryDetails", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            inventory.removeAtIndex(indexPath.row)
            tableView.endUpdates()
        }
    }
}

    // MARK: - InventoryDetailsControllerDelegate
extension InventoryListViewController: InventoryDetailsControllerDelegate {
    func deleteEmptyInventoryItem() {
        inventory.deleteNewInventoryItem()
    }
    
    func saveInventoryItem(inventory: InventoryEntity) {
        self.inventory.saveInventoryItem(inventory)
    }
}