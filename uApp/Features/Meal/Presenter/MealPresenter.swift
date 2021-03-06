//
//  MealPresenter.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

class MealPresenter {
    
    weak private var mealView: MealView?
    private let mealServices: MealServices
    fileprivate var mealList = [MealViewModel]()
    
    required init(mealView: MealView, mealServices: MealServices ) {
        self.mealServices = mealServices
        self.mealView = mealView
    }
}

extension MealPresenter: MealViewPresenter {
    
    func getMeals(searchString: String = "") {
        self.mealView?.showLoading()
        self.mealServices.getMeals(searchString: searchString, completionHandler: { [weak self] result in
            self?.mealView?.hideLoading()
            
            switch result {
            case .success(let data):
                self?.mealList.removeAll()
                self?.mealView?.reloadData()
                
                if let meals = data?.meals {
                    for meal in meals {
                        self?.mealList.append(MealViewModel(meal: meal))
                    }
                }
                self?.mealView?.reloadData()
            case .failure(let error):
                self?.mealView?.showError(msg: error.asAFError?.errorDescription)
            }
        })
    }
    
    func getBanner() {
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] timer in
            self?.mealServices.getRandomMeal(completionHandler: { [weak self] result in
                switch result {
                case .success(let data):
                    if let randomMeals = data?.meals, let banner = randomMeals.first {
                        let randomMeal = MealViewModel(meal: banner)
                        guard let stringURL = randomMeal.picture, let imgURL = URL(string: stringURL) else {
                            return
                        }
                        self?.mealView?.showBanner(img: imgURL)
                    }
                case .failure(let error):
                    timer.invalidate()
                    self?.mealView?.showError(msg: error.asAFError?.errorDescription)
                }
            })
        }
    }

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.mealList.count
    }
    
    func getMealAt(index: IndexPath) -> MealViewModel? {
        return self.mealList[index.row]
    }
}
