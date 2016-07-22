//
//  DetailsDepartmentController.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/19/16.
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

class DetailsDepartmentController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var lowConstraint: NSLayoutConstraint!
    
    var result = [String]()
    weak var delegate: DetailsDepartmentControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 10
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func adjustingHeight(show: Bool, notification: NSNotification) {
        if show {
            lowConstraint.constant = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height)!
        } else {
            lowConstraint.constant = 0
        }
    }
}

extension DetailsDepartmentController: UITableViewDelegate {
    
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
}

extension DetailsDepartmentController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResultSections.resultSectionsCount
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch ResultSections(rawValue: section)! {
        case .result:
            return result.count
        case .input:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.showChoice(result[indexPath.row])
        navigationController?.popViewControllerAnimated(true)
    }
}

extension DetailsDepartmentController: TextFieldEndEditing {    
    
    func inputCellEndEditing(text: String) {
        delegate?.showChoice(text)
        navigationController?.popViewControllerAnimated(true)
    }
}