//
//  DetailsDepartmentController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class SeveralResultsViewController: DetailsViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var lowConstraint: NSLayoutConstraint!
    @IBOutlet var highConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.setupResizingCell()
        setupKeyboardNotifications()
    }
    
    override func adjustingHeight(show: Bool, notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            tableView.contentInset = UIEdgeInsetsZero
        } else {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardViewEndFrame.height, 0)
        }
    }
    
    // MARK: - Override
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch ResultSections(rawValue: indexPath.section)! {
        case .result:
            return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        case .input:
            let cell = tableView.dequeueReusableCellWithIdentifier("inputCell") as! InputCell
            cell.delegate = self
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendChoosenDepartment(departments[indexPath.row])
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResultSections.resultSectionsCount
    }
}

