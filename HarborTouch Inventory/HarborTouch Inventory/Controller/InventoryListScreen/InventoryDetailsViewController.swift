//
//  InventoryDetailsViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/1/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol InventoryDetailsControllerDelegate: class {
    func deleteEmptyInventoryItem()
    func saveInventoryItem(inventory: InventoryEntity)
}

class InventoryDetailsViewController: BaseViewController {
    
    var inventory: InventoryEntity!
    let sourceData = SourceData()
    weak var delegate: InventoryDetailsControllerDelegate?
    
    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Inventory Details"
        
        let save = UIBarButtonItem(title: "Save", style: .Done, target: self, action: #selector(onSaveAction))
        save.applyDefaultStyle()
        
        self.navigationItem.setRightBarButtonItem(save, animated: true)
        setupKeyboardNotifications()
    }
    
    // MARK: - Actions
    func onSaveAction() {
        delegate?.saveInventoryItem(inventory)
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Override
    override func adjustingHeight(show: Bool, notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            tableView.contentInset = UIEdgeInsetsZero
        } else {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardViewEndFrame.height, 0)
        }
    }
    
    override func backAction() {
        super.backAction()
        delegate?.deleteEmptyInventoryItem()
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
        
    }
}