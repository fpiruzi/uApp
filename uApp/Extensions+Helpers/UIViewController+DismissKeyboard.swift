//
//  UIViewController+DismissKeyboard.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenUserTapView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
