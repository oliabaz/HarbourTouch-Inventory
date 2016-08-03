//
//  InputCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/21/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol InputCellDelegate: class {
    func inputCellTextEndEditing(text: String)
}

class InputCell: UITableViewCell {
    
    @IBOutlet private weak var textField: UITextField!
    
    weak var delegate: InputCellDelegate?
    
    var string: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onDoneAction() {
        textField.resignFirstResponder()
        delegate?.inputCellTextEndEditing(textField.text!)
    }
}

extension InputCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


