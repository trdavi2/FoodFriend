//
//  MaterialButton.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/28/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class MaterialButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOOW_COLOR, green: SHADOOW_COLOR, blue: SHADOOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
}
