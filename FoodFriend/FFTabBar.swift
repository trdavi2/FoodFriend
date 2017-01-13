//
//  FFTabBar.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/28/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class FFTabBar: UITabBar {
    override func awakeFromNib() {
        self.barTintColor = UIColor(red: 0.447, green: 0.573, blue: 0.388, alpha: 1)
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor.white
        //self.selectedImageTintColor = UIColor.whiteColor()
        self.isTranslucent = false
    }
    
}
