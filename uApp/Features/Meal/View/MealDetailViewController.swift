//
//  MealDetailViewController.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import UIKit

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    
    var meal: MealViewModel?
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMealName()
        self.setMealInstructions()
    }
}

extension MealDetailViewController {
    fileprivate func setMealName(){
        self.mealNameLabel.text = self.meal?.name
    }
    
    fileprivate func setMealInstructions(){
        self.mealInstructionsLabel.text = self.meal?.instructions
    }
}
