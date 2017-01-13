//
//  RecipeIngredientsView.swift
//  FoodFriend
//
//  Created by Tim Davis on 11/19/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class RecipeIngredientsView: UIView, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var fullIngredientList: [String]!
    var ingredientList: [String]!
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOOW_COLOR, green: SHADOOW_COLOR, blue: SHADOOW_COLOR, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        ingredientsTable.delegate = self
        ingredientsTable.dataSource = self
        
        fullIngredientList = [String]()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fullIngredientList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        cell.textLabel?.text = fullIngredientList[indexPath.row]
        
        return cell
    }
    
    func loadData(_ fullIngredientList: [String], ingredientList: [String])
    {
        self.fullIngredientList = fullIngredientList
        self.ingredientList = ingredientList
        print("***\(ingredientList)")
        ingredientsTable.reloadData()
    }
    
    @IBAction func addIngredients(_ sender: AnyObject)
    {
        if let pantryListData = UserDefaults.standard.value(forKey: "groceryList") as? [String]
        {
            var groceryList: [String] = pantryListData
            groceryList += ingredientList
            UserDefaults.standard.set(groceryList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
        }
        else {
            UserDefaults.standard.set(ingredientList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
        }
        
        addButton.isEnabled = false
    }
}
