//
//  CuisineRecipesView.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/7/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class CuisineRecipesView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var recipeTable: UITableView!
    @IBOutlet weak var titleBar: UINavigationItem!

    var cuisineChosen: String!
    var recipeList: RecipeList!
    var recipes: [Recipe]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipes = recipeList.recipes
        
        recipeTable.delegate = self
        recipeTable.dataSource = self
        
        titleBar.title = recipeList.paramFull
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)

        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let recipeChosen = recipes[indexPath.row]
        
        print("**")
        
        recipeChosen.downloadRecipeDetails { () -> () in
            print(recipeChosen.toString())
            self.performSegue(withIdentifier: "RecipeDetails", sender: recipeChosen)            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeDetails"
        {
            if let recipeDetail = segue.destination as? RecipeView
            {
                if let recipeChosen = sender as? Recipe
                {
                    recipeDetail.recipe = recipeChosen
                    //print(recipes[0])
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
