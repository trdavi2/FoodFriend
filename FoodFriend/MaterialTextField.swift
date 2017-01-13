//
//  MaterialTextField.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/13/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOOW_COLOR, green: SHADOOW_COLOR, blue: SHADOOW_COLOR, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
    }
    
    //For placeholder
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
}
