//
//  OneResultViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/25/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class OneResultViewController: DetailsViewController {

    @IBOutlet private weak var lowConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var textField: UITextField!
    var keyboardTextField: UITextField!
    var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.hidden = true
                
        setupNavigationBarButton(.Compose)
        tableView.setupResizingCell()
        setupKeyboardNotifications()
        
        keyboardTextField = UITextField(frame: CGRectMake(10,10,view.frame.width - 110,30))
        keyboardTextField.borderStyle = .RoundedRect
        keyboardTextField.delegate = self
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 45)
        toolbar.barTintColor = UIColor.blackColor()
        let done = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(onDoneAction))
        done.applyDefaultStyle()
        
        toolbar.addSubview(keyboardTextField)
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil), done], animated: false)
        textField.inputAccessoryView = toolbar
    }

    func setupNavigationBarButton(style: UIBarButtonSystemItem) {
        addButton = UIBarButtonItem(barButtonSystemItem: style, target: self, action: #selector(onAddAction))
        addButton.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = addButton
    }

    // MARK: - Actions
    func onDoneAction() {
        self.view.endEditing(true)
        delegate?.showChoosenDepartment(keyboardTextField.text!)
        navigationController?.popViewControllerAnimated(true)
    }

    func onAddAction() {
        if keyboardTextField.isFirstResponder() {
            keyboardTextField.resignFirstResponder()
            self.view.endEditing(true)
            setupNavigationBarButton(.Compose)
        } else {
            textField.becomeFirstResponder()
            keyboardTextField.becomeFirstResponder()
            setupNavigationBarButton(.Reply)
        }
    }
    
    // MARK: - Override
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendChoosenDepartment(departments[indexPath.row])
    }
}

    // MARK: - UITextFieldDelegate
extension OneResultViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        onDoneAction()
        return true
    }
}
