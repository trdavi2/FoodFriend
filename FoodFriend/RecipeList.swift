//
//  RecipeList.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/11/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import Foundation
import Alamofire

class RecipeList {
    
    var _recipes: [Recipe]
    var _param: String
    var _paramFull: String
    var _type: String
    var _urlString: String
    
    init(param: String, type: String) {
        _recipes = [Recipe]()
        _type = type
        _paramFull = param
        
        if(type == "Pantry")
        {
            _paramFull = "Pantry Options"
            _param = param
            _urlString = "\(URLBASE)\(_param)"
        }
        else if(type == "Search")
        {
            _param = param.lowercased().replacingOccurrences(of: " ", with: "+")
            _urlString = "\(URLBASE)\(SEARCH_URL)\(_param)"
        }
        else if(type == "Cuisines")
        {
            _param = param.lowercased()
            _urlString = "\(URLBASE)\(CUISINE_URL)\(_param)"
        }
        else if(type == "Courses")
        {
            _param = param.replacingOccurrences(of: " ", with: "+")
            _urlString = "\(URLBASE)\(COURSE_URL)\(_param)"
        }
        else
        {
            _param = param.lowercased().replacingOccurrences(of: " ", with: "-")
            _urlString = "\(URLBASE)\(HOLIDAY_URL)\(_param)"
        }
    }
    
    var recipes: [Recipe] {
        return _recipes
    }
    
    var paramFull: String {
        return _paramFull
    }
    
    func downloadCuisineRecipes(_ completed: @escaping DownloadComplete){
        _recipes.removeAll()
        print(_param)
        print(_urlString)
        let url = (NSURL(scheme: "https", host: "api.yummly.com", path: _urlString) as? URL)!
        
        print(url)
        Alamofire.request(.GET, url).responseJSON { (request: URLRequest?, response: HTTPURLResponse?, result: Result<AnyObject>) -> Void in
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let output = dict["matches"] as? [Dictionary<String, AnyObject>]{
                    for i in output{
                        if let id = i["id"] as? String, let name = i["recipeName"] as? String, let ingredients = i["ingredients"] as? [String]{
                            let recipe = Recipe(id: id, name: name, ingredients: ingredients)
                            
                            //print(recipe.toString())
                            
                            self._recipes.append(recipe)
                        }
                    }
                    for i in self._recipes{
                        print(i.toString())
                    }
                    completed()
                    
                }
            }
        }

    }
}
