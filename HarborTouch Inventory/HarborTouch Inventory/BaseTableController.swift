//
//  BaseTableController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/25/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

protocol DetailsDepartmentControllerDelegate: class {
    func showChoice(choice: String)
}

enum ResultSections: Int {
    case result = 0, input
    
    static var resultSectionsCount: Int = {
        var max: Int = 0
        while let _ = ResultSections(rawValue: max) { max += 1 }
        return max
    }()
}

class BaseTableController: BaseViewController {
    
    var result = [String]()
    weak var delegate: DetailsDepartmentControllerDelegate?
    
    func sendChoice(choice: String) {
        delegate?.showChoice(choice)
        navigationController?.popViewControllerAnimated(true)
    }
}

extension BaseTableController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ResultSections(rawValue: section)! {
        case .result:
            return result.count
        case .input:
            return 1
        }
    }
}

//extension BaseViewController: UITableViewDelegate {
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("departmentCell") as! DepartmentCell
//        cell.backgroundView = tableView.setupCellBackground(indexPath)
//        return cell
//    }
//}

extension BaseTableController: InputCellDelegate {
    
    func inputCellTextEndEditing(text: String) {
        sendChoice(text)
    }
}
