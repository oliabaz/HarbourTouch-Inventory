//
//  BaseTableController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/25/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol DetailsDepartmentControllerDelegate: class {
    func showChoosenDepartment(choice: String)
}

enum ResultSections: Int {
    case result = 0, input
    
    static var resultSectionsCount: Int = {
        var max: Int = 0
        while let _ = ResultSections(rawValue: max) { max += 1 }
        return max
    }()
}

class DetailsViewController: BaseViewController {
    
    var departments = [String]()
    weak var delegate: DetailsDepartmentControllerDelegate?
    
    func sendChoosenDepartment(choice: String) {
        delegate?.showChoosenDepartment(choice)
        navigationController?.popViewControllerAnimated(true)
    }
}

extension DetailsViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ResultSections(rawValue: section)! {
        case .result:
            return departments.count
        case .input:
            return 1
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("departmentCell") as! DepartmentCell
        cell.backgroundView = tableView.setupCellBackground(indexPath)
        cell.department = departments[indexPath.row]
        return cell
    }
}

extension DetailsViewController: InputCellDelegate {
    
    func inputCellTextEndEditing(text: String) {
        sendChoosenDepartment(text)
    }
}
