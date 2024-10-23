//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        buttonSet()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(sender.currentTitle!)
        updateUI()
    }
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.storyText()
        choice1Button.setTitle(storyBrain.choice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.choice2Text(), for: .normal)
    }
    
    func buttonSet() {
        choice1Button.titleLabel?.numberOfLines = 0
        choice1Button.titleLabel?.adjustsFontSizeToFitWidth = true
        choice1Button.titleLabel?.lineBreakMode = .byWordWrapping
        choice2Button.titleLabel?.numberOfLines = 0
        choice2Button.titleLabel?.adjustsFontSizeToFitWidth = true
        choice2Button.titleLabel?.lineBreakMode = .byWordWrapping
    }
    
}

