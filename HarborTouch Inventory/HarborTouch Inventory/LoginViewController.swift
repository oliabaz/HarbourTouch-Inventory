//
//  LoginViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/8/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelImage: UIImageView!
    @IBOutlet weak var highConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextField.delegate = self
        passwordTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if show == false {
            highConstraint.constant = 0
            labelImage.alpha = 1
        } else {
            highConstraint.constant = -160
            labelImage.alpha = 0
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == messageTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.endEditing(true)
        }
        return true
    }

}
