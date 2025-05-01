//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import Hue

class ToDoListViewController: SwipeTableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedCategory : Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let colourHex = selectedCategory?.backColour {
            title = selectedCategory!.name
            guard let navBar = navigationController?.navigationBar else {
                fatalError("Navigation controller does not exist.")
            }
            
            // Setup Nav Bar
            navBar.prefersLargeTitles = true
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            // Setup Nav Bar colour
            appearance.backgroundColor = UIColor(hex: colourHex)
            var contrastColour = UIColor.white
            UIColor(hex: colourHex).isDark ? (contrastColour = UIColor.white) : (contrastColour = UIColor.black)
            
            // Setup Nav Bar Title Colour
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastColour]
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastColour]
            
            // Setup Nav Bar Back Button Colour
            let backButtonAppearance = UIBarButtonItemAppearance()
            backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastColour]
            appearance.backButtonAppearance = backButtonAppearance
            
            // Apply appearance to Nav Bar
            navBar.standardAppearance = appearance
            navBar.scrollEdgeAppearance = navBar.standardAppearance
            navBar.tintColor = contrastColour
            
            // Customise bar button item appearance
            let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            rightButton.tintColor = contrastColour
            navigationItem.rightBarButtonItem = rightButton
            
            // Edit background of search bar
            searchBar.barTintColor = UIColor(hex: colourHex)
        }
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            
            if let colour = UIColor(hex: selectedCategory!.backColour).darken(by:( CGFloat(indexPath.row) / CGFloat(todoItems!.count))/4) {
                print(colour)
                cell.backgroundColor = colour
                colour.isDark ? (cell.textLabel?.textColor = UIColor.white) : (cell.textLabel?.textColor = UIColor.black)
            }
            
            // Ternary operator ==>
            // value = condition ? valueIfTrue : valueIfFalse
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    // The explanation mark is a not opporator and will make this line the opposite of its previous value
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status \(error)")
            }
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the Add Item button on our UIAlert
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving items, \(error)")
                }
            }
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Model Manipulation Methods
    
    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        
        if let itemToDelete = self.todoItems?[indexPath.row] {
                do {
                    try self.realm.write {
                        self.realm.delete(itemToDelete)
                    }
                } catch {
                    print("Error deleting category, \(error)")
                }
                tableView.reloadData()
            }
    }
    
}

//MARK: - Search bar methods
extension ToDoListViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

