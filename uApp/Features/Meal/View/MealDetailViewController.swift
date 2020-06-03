//
//  MealDetailViewController.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealIngredientsLabel: UILabel!
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    @IBOutlet weak var player: YTPlayerView!
    
    var meal: MealViewModel?
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMealName()
        self.setMealInstructions()
        self.setMealIngredients()
        self.setVideo()
    }
}

extension MealDetailViewController {
    fileprivate func setMealName(){
        self.mealNameLabel.text = self.meal?.name
    }
    
    fileprivate func setMealInstructions(){
        self.mealInstructionsLabel.text = self.meal?.instructions
    }
    
    fileprivate func setMealIngredients(){
        self.mealIngredientsLabel.text = self.meal?.ingredients
    }
    
    fileprivate func setVideo(){
        if let videoId = self.meal?.youtube {
            self.player.load(withVideoId: videoId)
        }
    }
}
