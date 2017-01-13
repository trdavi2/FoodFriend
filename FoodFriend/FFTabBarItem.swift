//
//  FFTabBarItem.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/28/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class FFTabBarItem: UITabBarItem {
    
    override func awakeFromNib() {
        //self.setTitleTextAttributes(UITextA, forState: UIControlState.Disabled)
        self.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: UIControlState())
        //self.selectedImage?.
    }
}
