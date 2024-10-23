//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String
    let choice2Destination: Int
    
    init(t: String, c1: String, cd1: Int, c2: String, cd2: Int) {
        self.title = t
        self.choice1 = c1
        self.choice1Destination = cd1
        self.choice2 = c2
        self.choice2Destination = cd2
        }
}
