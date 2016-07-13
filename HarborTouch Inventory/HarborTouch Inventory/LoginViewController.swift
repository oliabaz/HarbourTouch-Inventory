//
//  LoginViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/8/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var highConstraint: NSLayoutConstraint!
    @IBOutlet weak var lowConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)

    }
    
    override func viewWillAppear(animated: Bool) {
//        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBarHidden = false
    }
    
    func handleTap(sender: UIViewController) {
        view.endEditing(true)
    }
    

    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    func adjustingHeight(show: Bool, notification: NSNotification) {
        if show {
            highConstraint.constant = -135
            lowConstraint.constant = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
            logoView.alpha = 0
        } else {
            highConstraint.constant = 25
            lowConstraint.constant = 10
            logoView.alpha = 1
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == passwordField {
            textField.resignFirstResponder()
            performSegueWithIdentifier("login", sender: self)
        } else {
            passwordField.becomeFirstResponder()
        }
        return true
    }
       
}