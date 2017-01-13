//
//  PantryListView.swift
//  FoodFriend
//
//  Created by Tim Davis on 11/6/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class PantryListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var pantryTable: UITableView!
    
    var pantryList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pantryTable.delegate = self
        pantryTable.dataSource = self
        
        if let pantryListData = UserDefaults.standard.value(forKey: "pantryList") as? [String]
        {
            pantryList = pantryListData
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if let pantryListData = UserDefaults.standard.value(forKey: "pantryList") as? [String]
        {
            pantryList = pantryListData
            pantryTable.reloadData()
        }
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pantryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PantryListItemCell", for: indexPath)
        
        cell.textLabel?.text = pantryList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pantryList.remove(at: indexPath.row)
            UserDefaults.standard.set(pantryList, forKey: "pantryList")
            UserDefaults.standard.synchronize()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func editList(_ sender: AnyObject)
    {
        if pantryTable.isEditing == false {
            pantryTable.isEditing = true
        }
        else {
            pantryTable.isEditing = false
        }
    }
    
    @IBAction func searchRecipes(_ sender: AnyObject)
    {
        var param = ""
        
        for i in pantryList
        {
            param += "\(PANTRY_URL)\(i.lowercased())"
        }
        
        let rList = RecipeList(param: param, type: "Pantry")
        rList.downloadCuisineRecipes { () -> () in
            //let recipes = rList.recipes
            self.performSegue(withIdentifier: "PantrySearch", sender: rList)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PantrySearch"
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
