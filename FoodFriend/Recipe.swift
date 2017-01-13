//
//  Recipe.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/7/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import Foundation
import Alamofire

class Recipe
{
    fileprivate var _id: String!
    fileprivate var _name: String!
    fileprivate var _ingredients: [String]!
    fileprivate var _fullIngredients: [String]!
    fileprivate var _flavors: Dictionary<String, Float>!
    fileprivate var _source: Dictionary<String, String>!
    fileprivate var _numOfServings: Int!
    fileprivate var _totalTime: String!
    
    init(id: String, name: String, ingredients: [String])
    {
        _id = id
        _name = name
        _ingredients = ingredients
    }
    
    var id: String{
        return _id
    }
    
    var name: String{
        return _name
    }
    
    var ingredients: [String]{
        return _ingredients
    }
    
    var fullIngredients: [String]{
        return _fullIngredients
    }
    
    var flavors: Dictionary<String, Float>{
        return _flavors
    }
    
    var source: Dictionary<String, String>{
        return _source
    }
    
    var numOfServings: Int {
        return _numOfServings
    }
    
    var totalTime: String {
        return _totalTime
    }
    
    func toString() -> String{
        return "\(_name)\n\(_id)\n\(_fullIngredients)\n\(_flavors)\n\(_source)\n\(_totalTime)\n\(_numOfServings)"
    }
    
    func downloadRecipeDetails(_ completed: @escaping DownloadComplete)
    {
        let urlString = "\(RECIPE_URL_BEGIN)\(_id)\(RECIPE_URL_END)"
        let url = (NSURL(scheme: "https", host: "api.yummly.com", path: urlString) as? URL)!
        
        print(url)
        Alamofire.request(.GET, url).responseJSON { (request: URLRequest?, response: HTTPURLResponse?, result: Result<AnyObject>) -> Void in
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let totalTime = dict["totalTime"] as? String{
                    self._totalTime = totalTime
                }
                if let numOfServings = dict["numberOfServings"] as? Int {
                    self._numOfServings = numOfServings
                }
                if let fullIngredients = dict["ingredientLines"] as? [String] {
                    self._fullIngredients = fullIngredients
                }
                if let source = dict["source"] as? Dictionary<String, String> {
                    self._source = source
                }
                if let flavors = dict["flavors"] as? Dictionary<String, Float> {
                    self._flavors = flavors
                }
                completed()
            }
        }
        
    }

}
