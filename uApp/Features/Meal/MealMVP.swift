//
//  MealMVP.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

protocol MealView: class {
    func showLoading()
    func hideLoading()
    func reloadData()
    func showError(msg: String?)
    func showBanner(img: URL)
}

protocol MealViewPresenter {
    func getMeals(searchString: String)
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func getMealAt(index: IndexPath) -> MealViewModel?
    func getBanner()
}
