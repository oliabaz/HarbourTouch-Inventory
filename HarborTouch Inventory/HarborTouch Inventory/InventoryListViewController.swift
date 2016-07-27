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
    
    var inventory = [NSManagedObject]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSelfResizeCell(tableView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")

        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            inventory = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
