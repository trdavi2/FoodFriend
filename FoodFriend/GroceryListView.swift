//
//  GroceryListView.swift
//  FoodFriend
//
//  Created by Tim Davis on 10/12/15.
//  Copyright © 2015 TimDavis. All rights reserved.
//

import UIKit

class GroceryListView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    

    @IBOutlet weak var groceryTable: UITableView!
    @IBOutlet weak var groceryItem: UITextField!
    
    var groceryList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryTable.delegate = self
        groceryTable.dataSource = self
        groceryTable.isEditing = false
        groceryItem.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GroceryListView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        if let groceryListData = UserDefaults.standard.value(forKey: "groceryList") as? [String]
        {
            groceryList = groceryListData
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if let groceryListData = UserDefaults.standard.value(forKey: "groceryList") as? [String]
        {
            groceryList = groceryListData
            groceryTable.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryListItemCell", for: indexPath)
        
        cell.textLabel?.text = groceryList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groceryList.remove(at: indexPath.row)
            UserDefaults.standard.set(groceryList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        groceryItem.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func sendToPantry(_ sender: AnyObject) {
        if let pantryListData = UserDefaults.standard.value(forKey: "pantryList") as? [String]
        {
            var pantryList: [String] = pantryListData
            pantryList += groceryList
            UserDefaults.standard.set(pantryList, forKey: "pantryList")
            UserDefaults.standard.synchronize()
            groceryList.removeAll()
            UserDefaults.standard.set(groceryList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
        }
        else {
            UserDefaults.standard.set(groceryList, forKey: "pantryList")
            UserDefaults.standard.synchronize()
            groceryList.removeAll()
            UserDefaults.standard.set(groceryList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
        }
        
        groceryTable.reloadData()
    }
    
    @IBAction func editList(_ sender: AnyObject)
    {
        if groceryTable.isEditing == false {
            groceryTable.isEditing = true
        }
        else {
            groceryTable.isEditing = false
        }
    }
    
    @IBAction func addItem(_ sender: AnyObject) {
        if groceryItem.text as String! != "" {
            let item: String = groceryItem?.text as String!
            print(item)
            groceryList.append(item)
            UserDefaults.standard.set(groceryList, forKey: "groceryList")
            UserDefaults.standard.synchronize()
            groceryTable.reloadData()
            groceryItem.text = ""
        }
    }
}

