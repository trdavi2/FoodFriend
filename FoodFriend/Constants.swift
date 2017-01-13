//
//  Constants.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/9/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import Foundation
import UIKit

typealias DownloadComplete = () -> ()

let SHADOOW_COLOR: CGFloat = 157.0 / 255.0

let URLBASE = "/v1/api/recipes?_app_id=0e79df5a&_app_key=89e6e6c7088797f40de82910bd670c4a"
let RECIPE_URL_BEGIN = "/v1/api/recipe/"
let RECIPE_URL_END = "?_app_id=0e79df5a&_app_key=89e6e6c7088797f40de82910bd670c4a"
let CUISINE_URL = "&allowedCuisine[]=cuisine^cuisine-"
let COURSE_URL = "&allowedCourse[]=course^course-"
let HOLIDAY_URL = "&allowedHoliday[]=holiday^holiday-"
let SEARCH_URL = "&q="
let PANTRY_URL = "&allowedIngredient[]="
































//let rec = Recipe(id: "23", name: "Food", ingredients: ["gggfd", "fsdfsF"])
//var r = [Recipe]()
//r.append(rec)







//MAKE SEPARATE FUNCTION, USE A CONSTANT THING IN THIS ONE



/*
let urlString = "/v1/api/recipes?_app_id=0e79df5a&_app_key=89e6e6c7088797f40de82910bd670c4a&allowedCuisine[]=cuisine^cuisine-" + cuisineChosen
let session = NSURLSession.sharedSession()
let url = NSURL(scheme: "https", host: "api.yummly.com", path: urlString)!

session.dataTaskWithURL(url) {  (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in

if let responseData = data
{
do{
let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)

if let dict = json as? Dictionary<String, AnyObject>{
if let results = dict["matches"] as? [Dictionary<String, AnyObject>]{
for i in results{
if let id = i["id"] as? String, let name = i["recipeName"] as? String, let ingredients = i["ingredients"] as? [String]{
let recipe = Recipe(id: id, name: name, ingredients: ingredients)

//print(recipe.toString())

recipes.append(recipe)
}
}
dispatch_async(dispatch_get_main_queue(), {
self.performSegueWithIdentifier("CuisineRecipesView", sender: recipes)
})
}
}
}
catch{
print("error")
}
} else{

}
}.resume()
*/

/*var recipes = [Recipe]()

self.getRecipes(cuisineChosen) { (result) -> Void in
if let recipes: [Recipe] = result {
for i in recipes{
print(i.toString())
}
}
}
for i in recipes{
print(i.toString())
}
performSegueWithIdentifier("CuisineRecipesView", sender: recipes)*/
