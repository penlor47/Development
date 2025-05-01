//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Penelope Lorrimore on 18/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import Hue

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {
            fatalError("Navigation controller does not exist.")
        }
        // Setup Nav Bar
        navBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        // Setup Nav Bar appearance
        appearance.backgroundColor = UIColor(hex: "#3D6369")
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#A5CFD3")]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#A5CFD3")]
        // Apply appearance to Nav Bar
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = navBar.standardAppearance
    }
    
    //MARK: - TableView DataSource Methods
    
    // Get the number of rows that should be within the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    // Create a reusable cell that will be replicated for the list within the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        cell.backgroundColor = UIColor(hex: categories?[indexPath.row].backColour ?? "#264247")
        cell.textLabel?.textColor = UIColor(hex: categories?[indexPath.row].textColour ?? "#A5CFD3")
        
        return cell

    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK: - Data Manipulation Methods
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        tableView.reloadData()        
    }
        
    override func updateModel(at indexPath: IndexPath) {
        
            if let categoryToDelete = self.categories?[indexPath.row] {
                do {
                    try self.realm.write {
                        self.realm.delete(categoryToDelete)
                    }
                } catch {
                    print("Error deleting category, \(error)")
                }
                tableView.reloadData()
            }
    }
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // Create alert that will allow a new category to be added
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            // What happens when the Add Category button is pressed
            
            let newCategory = Category()
            newCategory.name = textField.text!
            let randomColour = UIColor.randomColour
            let colourHex = randomColour.hexValue()
            newCategory.backColour = colourHex
            UIColor(hex: colourHex).isDark ? (newCategory.textColour = "#FFFFFF") : (newCategory.textColour = "#000000")
            
            self.save(category: newCategory)
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

