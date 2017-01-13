//
//  CuisineView.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/6/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CuisineView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var optionTable: UITableView!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    
    let cuisine = ["American", "Italian", "Mexican", "French", "Indian", "Greek", "Swedish", "Portuguese", "Chinese", "Cuban", "Spanish", "German"]
    let courses = ["Main Dishes", "Desserts", "Side Dishes", "Lunch and Snacks", "Appetizers", "Salads", "Breads", "Breakfast and Brunch", "Soups", "Beverages", "Condiments and Sauces", "Cocktails"]
    let holidays = ["Christmas", "Summer", "Thanksgiving", "New Year", "Super Bowl", "Halloween", "Hanukkah", "4th of July"]
    var paramChosen: String!
    var searchType: String!
    
    //var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionTable.delegate = self
        optionTable.dataSource = self
        
        titleBar.title = searchType
        //self.navigationItem.backBarButtonItem? = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchType == "Cuisines") {
            return cuisine.count
        }
        else if(searchType == "Courses") {
            return courses.count
        }
        else {
            return holidays.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CuisineCell", for: indexPath)
        
        if(searchType == "Cuisines")
        {
            cell.textLabel?.text = cuisine[indexPath.row]
        
            let imageName = UIImage(named: cuisine[indexPath.row])
            cell.imageView?.image = imageName
        }
        else if(searchType == "Courses")
        {
            cell.textLabel?.text = courses[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = holidays[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(searchType == "Cuisines") {
            paramChosen = cuisine[indexPath.row]
        }
        else if(searchType == "Courses") {
            paramChosen = courses[indexPath.row]
        }
        else {
            paramChosen = holidays[indexPath.row]
        }
        
        let rList = RecipeList(param: paramChosen, type: searchType)
        rList.downloadCuisineRecipes { () -> () in
            //let recipes = rList.recipes
            self.performSegue(withIdentifier: "CuisineRecipesView", sender: rList)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CuisineRecipesView"
        {
            if let recipesView = segue.destination as? CuisineRecipesView
            {
                if let recipes = sender as? RecipeList
                {
                    recipesView.recipeList = recipes
                    //print(recipes[0])
                }
            }
        }
    }
    
}
