//
//  QuestionButton.swift
//  HarborTouch Inventory
//
//  Created by Bazyleva, Olga on 7/14/16.
//  Copyright © 2016 Bazyleva, Olga. All rights reserved.
//

import UIKit

class QuestionButton: UIBarButtonItem {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.image = UIImage(named: "question")?.imageWithRenderingMode(.AlwaysOriginal)
    }
}
