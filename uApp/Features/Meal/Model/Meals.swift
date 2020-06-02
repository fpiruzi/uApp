//
//  Meals.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

public struct Meals : Codable {
    let meals : [Meal]?

    enum CodingKeys: String, CodingKey {

        case meals = "meals"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meals = try values.decodeIfPresent([Meal].self, forKey: .meals)
    }

}
