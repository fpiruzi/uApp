//
//  UIHelper.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation

import MBProgressHUD

class UIHelper{
    static let sharedInstance = UIHelper()
}

//ProgressHUD
extension UIHelper{
    
    func showHUDInView(view: UIView){
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideHUDInView(view: UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }
}

//Alert controller
extension UIHelper{
    
    func showAlertWithOkButton(viewController:UIViewController, title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: NSLocalizedString(Constants.Strings.ok, comment: ""), style: .cancel) { (action) in
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func showServiceError(viewController:UIViewController){
        self.showAlertWithOkButton(viewController: viewController, title: Constants.Strings.alertTitle, message: Constants.Strings.errorAlertMessage)
    }
}
