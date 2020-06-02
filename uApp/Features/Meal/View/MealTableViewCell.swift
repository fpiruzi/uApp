//
//  MealTableViewCell.swift
//  uApp
//
//  Created by Fabrizio Piruzi on 6/2/20.
//  Copyright © 2020 Fabrizio Piruzi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func setName(name: String?){
        self.nameLabel.text = name ?? ""
    }
    
    func setCategory(category: String?){
        self.categoryLabel.text = category ?? ""
    }
    
    func setMealImage(url: String?){
        guard let stringURL = url, let URL = URL(string: stringURL) else {
            return
        }
        let imageSize = CGSize(width: 50, height: 50)
        let transformer = SDImageResizingTransformer(size: imageSize, scaleMode: .fill)
        let placeholder = UIImage(named: Constants.Image.dishPlacerholder)?.resizeImage(targetSize: imageSize)
        self.imageView?.sd_setImage(with: URL , placeholderImage: placeholder, options: .progressiveLoad, context: [.imageTransformer: transformer])
    }
    
}
