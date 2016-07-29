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
        if show {
            tableView.frame.size.height = tableView.frame.height - (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
        } else {
            tableView.frame.size.height = tableView.frame.height + (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
        }
    }
}

extension SeveralResultsViewController {
    
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

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResultSections.resultSectionsCount
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendChoosenDepartment(departments[indexPath.row])
    }
}