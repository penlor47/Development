//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalDisplay: UILabel!
    
    @IBAction func percentButton(_ sender: UIButton) {
        
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }

    @IBAction func resetButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        totalDisplay.text = "7"
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        totalDisplay.text = "8"
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        totalDisplay.text = "9"
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }

    @IBAction func fourButton(_ sender: UIButton) {
        totalDisplay.text = "4"
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        totalDisplay.text = "5"
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        totalDisplay.text = "6"
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        totalDisplay.text = "1"
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        totalDisplay.text = "2"
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        totalDisplay.text = "3"
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        totalDisplay.text = "."
    }
    
    @IBAction func totalButton(_ sender: UIButton) {
        totalDisplay.text = "0"
    }
    
}

