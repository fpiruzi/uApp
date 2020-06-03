//
//  MealViewController.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MealViewController: UIViewController {
    
    var presenter: MealViewPresenter!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        self.presenter = MealPresenter(mealView: self, mealServices: MealServices())
        self.prepareTableView()
        self.prepareSearchTextField()
        self.hideKeyboardWhenUserTapView()
        self.presenter.getMeals(searchString: Constants.Strings.emptyString)
        self.presenter.getBanner()
    }
}

extension MealViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = self.presenter.getMealAt(index: indexPath)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as? MealTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setName(name: meal?.name)
        cell.setCategory(category: meal?.category)
        cell.setMealImage(url: meal?.picture)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = self.presenter.getMealAt(index: indexPath) {
            self.showMealDetail(meal: meal)
        } else {
            self.showAlert()
        }
    }
}

extension MealViewController {
    fileprivate func showMealDetail(meal: MealViewModel?){
        guard let mealDetailVC = self.storyboard?.instantiateViewController(identifier: MealDetailViewController.identifier) as? MealDetailViewController else {
            return
        }
        mealDetailVC.meal = meal
        
        if let navController = self.navigationController {
            navController.show(mealDetailVC, sender: nil)
        } else {
            self.present(mealDetailVC, animated: true, completion: nil)
        }
    }
}

extension MealViewController: MealView {
    func showError(msg: String?) {
        self.showAlert()
    }
    
    func showLoading() {
        UIHelper.sharedInstance.showHUDInView(view: self.view)
    }
    
    func hideLoading() {
        UIHelper.sharedInstance.hideHUDInView(view: self.view)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showBanner(img: URL) {
        let imageSize = CGSize(width: 50, height: 50)
        let transformer = SDImageResizingTransformer(size: imageSize, scaleMode: .fill)
        let placeholder = UIImage(named: Constants.Image.dishPlacerholder)?.resizeImage(targetSize: imageSize)
        self.bannerImageView.sd_setImage(with: img , placeholderImage: placeholder, options: .progressiveLoad, context: [.imageTransformer: transformer])
    }
}

extension MealViewController {
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func showAlert(title: String? = nil, message: String? = nil) {
        UIHelper.sharedInstance.showAlertWithOkButton(viewController: self, title: title ?? Constants.Strings.alertTitle, message: message ?? Constants.Strings.errorAlertMessage)
    }
}

// Search
extension MealViewController : UITextFieldDelegate {
    
    func prepareSearchTextField() {
        self.searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        self.presenter.getMeals(searchString: text)
    }
}
