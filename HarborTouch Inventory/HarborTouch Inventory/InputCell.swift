//
//  InputCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/21/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol TextFieldEndEditing: class {
    func inputCellEndEditing(text: String)
}

class InputCell: UITableViewCell {
    
    @IBOutlet private weak var textField: UITextField!
    
    weak var delegate: TextFieldEndEditing?
    
    var string: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onDoneAction() {
        textField.resignFirstResponder()
        delegate?.inputCellEndEditing(textField.text!)
    }
}

extension InputCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


