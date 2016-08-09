//
//  InventoryDetailsCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 8/2/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

enum InventoryDetailsType: String {
    case toggle = "toggle", none = "none"
}

protocol InventoryDetailsCellDelegate: class {
    func inventoryDetailsCellTextField(text: String, key: String)
    func inventoryDetailsCellButtonSwitch(on: Bool, key: String)
    func inventoryDetailsCellOnNextAction()
}

class InventoryDetailsCell: UITableViewCell {

    @IBOutlet private var keyLabel: UILabel!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var buttonSwitch: UISwitch!
    
    var cellType: InventoryDetailsType!
    weak var delegate: InventoryDetailsCellDelegate?

    var inventoryItem: [String: AnyObject?]? {
        didSet {
            let value = inventoryItem!["value"]!
            keyLabel.text = inventoryItem!["key"] as? String
            if value is NSNumber {
                textField.text? = value!.stringValue
                buttonSwitch.on = value as! Bool
            } else {
                textField.text = value as? String
            }
            cellType = InventoryDetailsType(rawValue: (inventoryItem!["type"]! as? String)!)
            setupType(cellType)
            buttonSwitch.addTarget(self, action: #selector(onSwitchAction), forControlEvents: .ValueChanged)
            
            let toolbar = UIToolbar()
            toolbar.frame = CGRect(x: 0, y: 0, width: frame.width, height: 45)
            toolbar.barTintColor = UIColor.blackColor()
            
            let prev = UIBarButtonItem(title: "Prev", style: .Done, target: self, action: #selector(onPrevAction))
            let next = UIBarButtonItem(title: "Next", style: .Done, target: self, action: #selector(onNextAction))
            let done = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(onDoneAction))
            prev.applyDefaultStyle()
            next.applyDefaultStyle()
            done.applyDefaultStyle()
            
            toolbar.setItems([prev, next, UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil), done], animated: true)
            textField.inputAccessoryView = toolbar
        }
    }
    
    func setupType(type: InventoryDetailsType) {
        switch type {
        case .toggle:
            buttonSwitch.hidden = false
            textField.hidden = true
        case .none:
            buttonSwitch.hidden = true
            textField.hidden = false
        }
    }
    
    // MARK: - Actions
    func onSwitchAction() {
        delegate?.inventoryDetailsCellButtonSwitch(self.buttonSwitch.on, key: keyLabel.text!)
    }
    
    func onPrevAction() {
        
    }
    
    func onNextAction() {
        delegate?.inventoryDetailsCellOnNextAction()
    }
    
    func onDoneAction() {
        textField.resignFirstResponder()
    }
}

    // MARK: - UITextFieldDelegate
extension InventoryDetailsCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
        delegate?.inventoryDetailsCellTextField(textField.text!, key: keyLabel.text!)
    }
}