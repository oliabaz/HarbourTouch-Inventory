
//  StoreSetupViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/13/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

enum StoreSections: Int {
    case StoreItems = 0, StoreItems2
}

class StoreSetupViewController: BaseViewController {
    
    let sourceData = StoreData()
    
    @IBOutlet weak var storeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Store Setup"
    }

}

extension StoreSetupViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("storeCell") as! StoreCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
        cell.storeItem = sourceData.storeItemForIndex(indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch StoreSections(rawValue: indexPath.section)! {
        case .StoreItems:
            switch StoreItems(rawValue: indexPath.row)! {
            case .departments:
                performSegueWithIdentifier("department", sender: tableView)
            default: break
            }
        default: break
        }
    }
}

extension StoreSetupViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 0, height: 1)))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return StoreItems.itemsCount
        case 1:
            return StoreItems2.itemsCount2
        default:
            return 0
        }
    }
}