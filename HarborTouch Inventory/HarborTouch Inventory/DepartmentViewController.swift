//
//  DepartmentViewController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class DepartmentViewController: BaseViewController {
    
    var transferResult = [String]()
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBAction func requestResults(sender: ChoiceButton) {
        
        RequestModel.requestDescription(sender.tag){ (result: [String]) -> Void in
            if result.count > 0 {
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
            let destinationVC = segue.destinationViewController as! DetailsDepartmentController
            destinationVC.result = transferResult
            destinationVC.delegate = self
    }
}

extension DepartmentViewController: DetailsDepartmentControllerDelegate {
    
    func showChoice(choice: String) {
        resultLabel.text = choice
    }
}