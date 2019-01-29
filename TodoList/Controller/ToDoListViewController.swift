//
//  ViewController.swift
//  TodoList
//
//  Created by snehal on 28/01/19.
//  Copyright © 2019 Snehal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "HouseHold"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "HouseHold2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem.title = "HouseHold3"
        itemArray.append(newItem3)
        
        // Do any additional setup after loading the view, typically from a nib.
            if let items = defaults.array(forKey: "TodoListArray ") as? [String]
        {
            itemArray = items
        }
        
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    //Mark Table view
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ToDOItemCell" , for : indexPath)
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    
    //Mark TableView Delegte method.
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("We have \(indexPath.row) correnspods to \(itemArray[indexPath.row])")
    
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    tableView.reloadData()

    tableView.deselectRow(at: indexPath, animated: true)
    

    
    
    // Check Mark from tableView Accessories
    
    
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfeild = UITextField()
        
       let alert = UIAlertController(title: "Add Items in Your TODO LIST", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //Mark more condition for text feild
            
            let newItem = Item()
            newItem.title = textfeild.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray ")
            self.tableView.reloadData()
            
            
        }
        
        alert.addTextField { (alerttextfeild) in
            alerttextfeild.placeholder = "Create new item"
            textfeild = alerttextfeild
            
        }
        alert.addAction(action)
        
        present(alert, animated: true , completion: nil)
    }
    
    
    

}

