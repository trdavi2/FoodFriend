//
//  RecipeView.swift
//  FoodFriend
//
//  Created by Tim Davis on 11/18/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit
import WebKit

class RecipeView: UIViewController {
    
    @IBOutlet weak var pageController: UISegmentedControl!

    @IBOutlet weak var detailsView: RecipeDetailView!
    @IBOutlet weak var ingredientsView: RecipeIngredientsView!
    @IBOutlet weak var webViewContainer: RecipeWebView!
    
    var webview: WKWebView!
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsView.changeTitle(recipe)
        ingredientsView.loadData(recipe.fullIngredients, ingredientList: recipe.ingredients)
        
        webview = WKWebView()
        webViewContainer.addSubview(webview)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0, y: 0, width: webViewContainer.bounds.width, height: webViewContainer.bounds.height)
        webview.frame = frame
        
        let url = recipe.source["sourceRecipeUrl"]! as String
        print("URL :::: \(url)")
        let requestURL = URL(string: url)!
        let request = URLRequest(url: requestURL)
        webview.load(request)
    }
    
    @IBAction func pageSwitch(_ sender: AnyObject)
    {
        if(pageController.selectedSegmentIndex == 0)
        {
            detailsView.isHidden = false
            ingredientsView.isHidden = true
            webViewContainer.isHidden = true
        }
        else if(pageController.selectedSegmentIndex == 1)
        {
            ingredientsView.isHidden = false
            detailsView.isHidden = true
            webViewContainer.isHidden = true
        }
        else if(pageController.selectedSegmentIndex == 2)
        {
            ingredientsView.isHidden = true
            detailsView.isHidden = true
            webViewContainer.isHidden = false
        }
    }
}
