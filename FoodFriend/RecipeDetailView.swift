//
//  RecipeDetailView.swift
//  FoodFriend
//
//  Created by Tim Davis on 11/18/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class RecipeDetailView: UIView {
    
    /*init() {
        super.init(frame: self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    */
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numOfServings: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    @IBOutlet weak var spicinessLbl: UILabel!
    @IBOutlet weak var meatyLbl: UILabel!
    @IBOutlet weak var bitterLbl: UILabel!
    @IBOutlet weak var sweetLbl: UILabel!
    @IBOutlet weak var sourLbl: UILabel!
    @IBOutlet weak var saltyLbl: UILabel!
    
    @IBOutlet weak var spicinessBar: UIProgressView!
    @IBOutlet weak var meatyBar: UIProgressView!
    @IBOutlet weak var bitterBar: UIProgressView!
    @IBOutlet weak var sweetBar: UIProgressView!
    @IBOutlet weak var sourBar: UIProgressView!
    @IBOutlet weak var saltyBar: UIProgressView!
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOOW_COLOR, green: SHADOOW_COLOR, blue: SHADOOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    func changeTitle(_ recipe: Recipe)
    {
        title?.text = recipe.name
        
        numOfServings?.text = "\(recipe.numOfServings)"
        totalTime?.text = recipe.totalTime
        
        var flavors = recipe.flavors
        
        if let spicy = flavors["Piquant"] {
            spicinessBar.progress = flavors["Piquant"]!
            meatyBar.progress = flavors["Meaty"]!
            bitterBar.progress = flavors["Bitter"]!
            sweetBar.progress = flavors["Sweet"]!
            sourBar.progress = flavors["Sour"]!
            saltyBar.progress = flavors["Salty"]!
        }
    }
    
}
