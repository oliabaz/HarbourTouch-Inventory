//
//  OneResultViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/25/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class OneResultViewController: BaseTableController {

    @IBOutlet weak var lowConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var keyboardTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelfResizeCell(tableView)
        setupKeyboardNotifications()
        textField.hidden = true
        
        keyboardTextField = UITextField(frame: CGRectMake(0,0,200,30))
        keyboardTextField.borderStyle = .RoundedRect
        keyboardTextField.delegate = self
        
        let textFieldButton = UIBarButtonItem(customView: keyboardTextField)
        
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        let done = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(onDoneAction))
        toolbar.setItems([textFieldButton, done], animated: false)
        toolbar.addSubview(keyboardTextField)
//        toolbar.addSubview(done)
        textField.inputAccessoryView = toolbar
    }
   
    func onDoneAction() {
        self.view.endEditing(true)
        delegate?.showChoice(keyboardTextField.text!)
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func onAddAction(sender: AnyObject) {
        textField.becomeFirstResponder()
        keyboardTextField.becomeFirstResponder()
    }
}

extension OneResultViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        keyboardTextField.resignFirstResponder()
        return true
    }
}

extension OneResultViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("departmentCell") as! DepartmentCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
        cell.result = result[indexPath.row]
        return cell
    }
}