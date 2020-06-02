//
//  Constants.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

public struct Constants {
    
    struct Strings {
        static let ok = "ok"
        static let alertTitle = "Alert"
        static let errorAlertMessage = "Ups! Please retry later."
        static let warning = "Warning"
        static let emptyList = "Empty List"
        static let emptyString = ""
        static let emptyInstructions = "Ups! This meal does not have instructions!"
    }
    
    struct API {
        static let searchUrl = "https://www.themealdb.com/api/json/v1/1/search.php"
        static let urlSearchQueryParamKey = "s"
    }
    
    struct Image {
        static let dishPlacerholder = "DishPlaceholder"
    }
    
}
