//
//  ViewController.swift
//  TodoList
//
//  Created by snehal on 28/01/19.
//  Copyright © 2019 Snehal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["HouseHold","Education","Your Goal", "Grocessery"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ToDOItemCell" , for : indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    //Mark TableView Delegte method.
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("We have \(indexPath.row) correnspods to \(itemArray[indexPath.row])")

    tableView.deselectRow(at: indexPath, animated: true)
    
    // Check Mark from tableView Accessories
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }else {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfeild = UITextField()
        
       let alert = UIAlertController(title: "Add Items in Your TODO LIST", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //Mark more condition for text feild
            
            self.itemArray.append(textfeild.text!)
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

