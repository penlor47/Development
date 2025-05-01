//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Penelope Lorrimore on 29/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

class SwipeTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50.0
        
    }
    
    // TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completion in
            
            self.updateModel(at: indexPath)

            completion(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return config
    }
    
    func updateModel(at indexPath: IndexPath) {
        // Update data model
    }
    
}
