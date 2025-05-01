//
//  randomColour.swift
//  Todoey
//
//  Created by Penelope Lorrimore on 29/04/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import Hue

extension UIColor {
    static var randomColour: UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
    func hexValue() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    func lighten(by percentage: CGFloat) -> UIColor? {
        return adjust(by: abs(percentage))
    }
    func darken(by percentage: CGFloat) -> UIColor? {
        return adjust(by: -1 * abs(percentage))
    }
    private func adjust(by percentage: CGFloat) -> UIColor? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(
                red: min(red + percentage, 1.0),
                green: min(green + percentage, 1.0),
                blue: min(blue + percentage, 1.0),
                alpha: alpha)
        } else {
            return nil
        }
    }
}
