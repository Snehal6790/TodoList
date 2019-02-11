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
    let datafilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "HouseHold"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "HouseHold2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "HouseHold3"
        itemArray.append(newItem3)
        
        // Do any additional setup after loading the view, typically from a nib.

        loadItem()

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
    
    self.saveData()

    tableView.deselectRow(at: indexPath, animated: true)
    

    
    
    // Check Mark from tableView Accessories
    
    
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfeild = UITextField()
        
       let alert = UIAlertController(title: "Add Items in Your TODO LIST", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //Mark more condition for text feild
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let newItem = Item(context: context)
            newItem.title = textfeild.text!
            
            self.itemArray.append(newItem)
            
            
        }
        
        alert.addTextField { (alerttextfeild) in
            alerttextfeild.placeholder = "Create new item"
            textfeild = alerttextfeild
            
        }
        alert.addAction(action)
        
        present(alert, animated: true , completion: nil)
    }
    
    
    func saveData(){
        
        
        do{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            try context.save()
            
        }catch{
            
            
            
        }
        
         self.tableView.reloadData()
    }
    
    func loadItem(){
        if let data = try? Data(contentsOf: datafilePath!){
           let decoder = PropertyListDecoder()
            do{
//                itemArray = try? decoder.decode([Item].self, from: data)
            }catch{
                
                print("Error in decoding this data \(error)")
            }
        }
        
    }
    

}

