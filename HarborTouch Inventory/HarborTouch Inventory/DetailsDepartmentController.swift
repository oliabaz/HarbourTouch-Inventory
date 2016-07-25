//
//  DetailsDepartmentController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class DetailsDepartmentController: BaseTableController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var lowConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSelfResizeCell(tableView)
        setupKeyboardNotifications()
    }
    
    override func adjustingHeight(show: Bool, notification: NSNotification) {
        if show {
            lowConstraint.constant = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
        } else {
            lowConstraint.constant = 0
        }
    }
}

extension DetailsDepartmentController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch ResultSections(rawValue: indexPath.section)! {
        case .result:
            let cell = tableView.dequeueReusableCellWithIdentifier("departmentCell") as! DepartmentCell
            cell.backgroundView = tableView.setupCellBackground(indexPath)
            cell.result = result[indexPath.row]
            return cell
        case .input:
            let cell = tableView.dequeueReusableCellWithIdentifier("inputCell") as! InputCell
            cell.delegate = self
            return cell
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResultSections.resultSectionsCount
    }
}
