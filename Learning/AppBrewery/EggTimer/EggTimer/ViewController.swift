//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let timeCounter = ["Soft": 3,"Medium":4, "Hard":7]
    var counter = 0
    var countDown = Timer()
    var maxCounter = 3
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressTimer: UIProgressView!
    var progressTime : Float = 0.0
    var timerProgress : Float = 0.1
    var player: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        countDown.invalidate()
        progressTime = 0.0
        progressTimer.progress = 0.0
        let hardness = sender.currentTitle!
        counter = timeCounter[hardness]!
        timerProgress = (1/Float(counter))
        titleLabel.text = "You chose: " + hardness
        countDown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            progressTimer.progress = progressTime
            progressTime += timerProgress
            counter -= 1
        }
        else if counter == 0 {
            countDown.invalidate()
            progressTimer.progress = 1
            titleLabel.text = "Done"
            playSound()
            
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    
    
}
