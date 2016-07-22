//
//  InputCell.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/21/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol  TextFieldEndEditing: class {
    func textFieldEndEditing(text: String)
}

class InputCell: UITableViewCell {
    
    @IBOutlet private weak var textField: UITextField!
    
    weak var delegate: TextFieldEndEditing?
    
    var string: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
}

extension InputCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text {
            delegate?.textFieldEndEditing(text)
        } else {
            delegate?.textFieldEndEditing("")
        }
    }
}


