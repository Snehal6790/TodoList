//
//  ViewController.swift
//  TodoList
//
//  Created by snehal on 28/01/19.
//  Copyright © 2019 Snehal. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    else {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    }
    
    



}

