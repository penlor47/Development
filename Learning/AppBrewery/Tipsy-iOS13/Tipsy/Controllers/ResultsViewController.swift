//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Penelope Lorrimore on 18/11/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bill = "0.00"
    var noPeople = 0
    var tip = 0

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = bill
        if bill == "0.00" {
            settingsLabel.text = "No bill to split"
        } else {
            settingsLabel.text = "Split between \(noPeople) people, with \(tip)% tip."
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
