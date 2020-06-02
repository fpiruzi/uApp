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
    private let ingredientKeyPattern = "strIngredient"
    
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
    
    public var instructions: String {
        return Constants.Strings.instructions + (isself.meal?.strInstructions ?? Constants.Strings.emptyInstructions)
    }
    
    public var ingredients: String? {
        guard let mealModel = self.meal else {
            return nil
        }
        
        var ingredientString: String = ""
        let ingredientsMirror = Mirror(reflecting: mealModel)
        
        for element in ingredientsMirror.children {
            if element.label?.starts(with: ingredientKeyPattern) ?? false, let ingredient = element.value as? String, !ingredient.isEmpty {
                let formattedIngredient = ingredient + ", "
                ingredientString += formattedIngredient
            }
        }
        if !ingredientString.isEmpty {
            ingredientString = String(ingredientString.dropLast(2))
        }
        return Constants.Strings.ingredients + ingredientString
    }
}
