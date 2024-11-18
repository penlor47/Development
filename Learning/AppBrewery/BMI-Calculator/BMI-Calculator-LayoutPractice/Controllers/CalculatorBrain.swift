//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Penelope Lorrimore on 18/11/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
       let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 1, green: 0.1491003036, blue: 0, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmi1dec = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmi1dec
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getcolour() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
}
