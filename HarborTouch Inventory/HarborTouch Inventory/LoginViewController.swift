//
//  LoginViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/8/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var highConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)

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
            highConstraint.constant = -160
            logoView.alpha = 0
        } else {
            highConstraint.constant = 0
            logoView.alpha = 1
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == messageField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            performSegueWithIdentifier("login", sender: self)
        }
        return true
    }
       
}
