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
    func saveInventoryItem(inventory: InventoryEntity, additionalInventory: AdditionalInventory)
}

class InventoryDetailsViewController: BaseViewController {
    
    var inventory: InventoryEntity!
    var additionalInventory: AdditionalInventory!
    var new = true
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
        additionalInventory = AdditionalInventory(inventory: inventory)
    }
    
    // MARK: - Actions
    func onSaveAction() {
        if additionalInventory.itemName == "" {
            let alertController = UIAlertController(title: "Item name is empty", message: "Do you want to continue? Current changes won't be saved.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
            alertController.addAction(UIAlertAction(title:  "Continue", style: .Default, handler: { (alert: UIAlertAction) in
                if self.new {
                    self.delegate?.deleteEmptyInventoryItem()
                }
                self.navigationController?.popViewControllerAnimated(true)
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            delegate?.saveInventoryItem(inventory, additionalInventory: additionalInventory)
        }
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
        if new {
            delegate?.deleteEmptyInventoryItem()
        }
        navigationController?.popViewControllerAnimated(true)
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
        cell.inventoryItem = sourceData.inventoryDetailsForIndex(indexPath.row, inventory: additionalInventory)
        cell.delegate = self
        return cell
    }
}

    // MARK: - InventoryDetailsCellDelegate
extension InventoryDetailsViewController: InventoryDetailsCellDelegate {
    
    func inventoryDetailsCellOnNextAction() {
        
    }
    
    func inventoryDetailsCellTextField(text: String, key: String) {
        switch InventoryKeys(rawValue: key)! {
        case .itemName:
            additionalInventory.itemName = text
        case .itemShortName:
            additionalInventory.itemShortName = text
        case .color:
            additionalInventory.color = text
        case .cost:
            additionalInventory.cost = NSNumberFormatter().numberFromString(text)
        case .glyph:
            additionalInventory.glyph = text
        case .itemNotes:
            additionalInventory.itemNotes = text
        case .itemTags:
            additionalInventory.itemTags = text
        case .lookup:
            additionalInventory.lookup = text
        case .minQty:
            additionalInventory.minQty = NSNumberFormatter().numberFromString(text)
        case .price:
            additionalInventory.price = NSNumberFormatter().numberFromString(text)
        case .qtyOnHand:
            additionalInventory.qtyOnHand = NSNumberFormatter().numberFromString(text)
        case .unit:
            additionalInventory.unit = text
        default:
            break
        }
    }
    
    func inventoryDetailsCellButtonSwitch(on: Bool, key: String) {
        switch InventoryKeys(rawValue: key)! {
        case .active:
            additionalInventory.active = on
        case .deptOpenKey:
            additionalInventory.deptOpenKey = on
        case .ebtItem:
            additionalInventory.ebtItem = on
        case .inheritTaxes:
            additionalInventory.inheritTaxes = on
        case .isGift:
            additionalInventory.isGift = on
        case .openItem:
            additionalInventory.openItem = on
        case .tareWeight:
            additionalInventory.tareWeight = on
        case .usesWeightScale:
            additionalInventory.usesWeightScale = on
        case .weighted:
            additionalInventory.weighted = on
        default:
            break
        }
    }
}