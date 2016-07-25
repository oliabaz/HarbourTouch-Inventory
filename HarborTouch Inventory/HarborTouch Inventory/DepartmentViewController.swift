//
//  DepartmentViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit
enum ResultAmount: Int {
    case none = 0, one
}

class DepartmentViewController: BaseViewController {
    
    var transferResult = [String]()
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBAction func requestResults(sender: ChoiceButton) {
        
        RequestModel.requestDescription(sender.tag){ (result: [String]) -> Void in
            if result.count == 1 {
                self.transferResult = result
                self.performSegueWithIdentifier("oneResult", sender: self)
            } else if result.count > 1 {
                self.transferResult = result
                self.performSegueWithIdentifier("details", sender: self)
            } else {
                let alertController = UIAlertController(title: "No result", message: "Sorry, but there is no result", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "details" {
            let destinationVC = segue.destinationViewController as! DetailsDepartmentController
            destinationVC.result = transferResult
            destinationVC.delegate = self
        }
        if segue.identifier == "oneResult" {
            let destinationVC = segue.destinationViewController as! OneResultViewController
            destinationVC.result = transferResult
            destinationVC.delegate = self
        }
    }
}

extension DepartmentViewController: DetailsDepartmentControllerDelegate {
    
    func showChoice(choice: String) {
        resultLabel.text = choice
    }
}