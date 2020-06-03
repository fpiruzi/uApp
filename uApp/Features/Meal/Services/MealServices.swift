//
//  MealServices.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import Alamofire

class MealServices {
    
    func getMeals(searchString: String? = "" ,completionHandler: @escaping(Result<Meals?, Error>) -> Void){
        
        guard let queryParams = prepareSearchQueryParam(searchString: searchString) else {
            return
        }
        
        AF.GET(Constants.API.searchUrl, query: queryParams).validate().responseDecodable(of: Meals.self) { response in
            switch response.result {
            case let .success(result):
                completionHandler(.success(result))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    fileprivate func prepareSearchQueryParam(searchString: String?) -> [String : String]? {
        
        guard let search = searchString else {
            return nil
        }
        
        return [Constants.API.urlSearchQueryParamKey : search]
    }
}

extension MealServices {
    
    func getRandomMeal(completionHandler: @escaping(Result<Meals?, Error>) -> Void){
        AF.GET(Constants.API.randomMeal).validate().responseDecodable(of: Meals.self) { response in
            switch response.result {
            case let .success(result):
                completionHandler(.success(result))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}

