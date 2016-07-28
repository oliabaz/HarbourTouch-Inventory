//
//  OneResultViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/25/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class OneResultViewController: BaseTableController {

    @IBOutlet private weak var lowConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    var keyboardTextField: UITextField!
    var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
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
        done.setTitleTextAttributes([NSFontAttributeName: (UIFont(name: "HelveticaNeue-Bold", size: 15))!], forState: .Normal)
        done.tintColor = UIColor.whiteColor()
        done.setBackgroundImage(UIImage(named: "bigBlueButton"), forState: .Normal, barMetrics: .Default)
        
        toolbar.addSubview(keyboardTextField)
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil), done], animated: false)
        keyboardTextField.inputAccessoryView = toolbar
    }

    func setupNavigationBarButton(style: UIBarButtonSystemItem) {
        addButton = UIBarButtonItem(barButtonSystemItem: style, target: self, action: #selector(onAddAction))
        addButton.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = addButton
    }

    
    func onDoneAction() {
        self.view.endEditing(true)
        delegate?.showChoice(keyboardTextField.text!)
        navigationController?.popViewControllerAnimated(true)
    }

    func onAddAction() {
        if keyboardTextField.isFirstResponder() {
            keyboardTextField.resignFirstResponder()
            self.view.endEditing(true)
            setupNavigationBarButton(.Compose)
        } else {
            keyboardTextField.becomeFirstResponder()
            setupNavigationBarButton(.Reply)
        }
    }
}

extension OneResultViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        onDoneAction()
        return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendChoice(result[indexPath.row])
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