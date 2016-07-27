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
    
    func setupSelfResizeCell(tableView: UITableView) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 10
    }
}

extension BaseTableController: UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ResultSections(rawValue: section)! {
        case .result:
            return result.count
        case .input:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        sendChoice(result[indexPath.row])
    }
}

extension BaseTableController: TextFieldEndEditing {
    
    func inputCellEndEditing(text: String) {
        sendChoice(text)
    }
}
