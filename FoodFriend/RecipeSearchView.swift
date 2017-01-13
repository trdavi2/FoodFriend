//
//  RecipeSearchView.swift
//  FoodFriend
//
//  Created by Tim Davis on 11/17/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class RecipeSearchView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RecipeSearchView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func byCuisine(_ sender: AnyObject)
    {
        self.performSegue(withIdentifier: "AutoSearch", sender: "Cuisines")
    }
    
    @IBAction func byCourse(_ sender: AnyObject)
    {
        self.performSegue(withIdentifier: "AutoSearch", sender: "Courses")
    }
    
    @IBAction func byHoliday(_ sender: AnyObject)
    {
        self.performSegue(withIdentifier: "AutoSearch", sender: "Holidays")
    }
    
    @IBAction func bySearch(_ sender: AnyObject)
    {
        if searchField.text?.isEmpty == false
        {
            let search = searchField.text
            let rList = RecipeList(param: search!, type: "Search")
            rList.downloadCuisineRecipes { () -> () in
                //let recipes = rList.recipes
                self.performSegue(withIdentifier: "ManualSearch", sender: rList)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AutoSearch"
        {
            if let typeView = segue.destination as? CuisineView
            {
                if let typeChosen = sender as?  String
                {
                    typeView.searchType = typeChosen
                }
            }
        }
        else if segue.identifier == "ManualSearch"
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
