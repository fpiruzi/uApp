//
//  MealViewModel.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

public class MealViewModel {
    
    private let meal: Meal?
    
    public init(meal: Meal?) {
        self.meal = meal
    }
    
    public var name: String? {
        return self.meal?.strMeal
    }
    
    public var category: String? {
        return self.meal?.strCategory
    }
    
    public var picture: String? {
        return self.meal?.strMealThumb
    }
}
