//
//  Category.swift
//  Todoey
//
//  Created by Penelope Lorrimore on 25/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var backColour: String = ""
    @objc dynamic var textColour: String = ""
    let items = List<Item>()
}
