//
//  WeatherModel.swift
//  Clima
//
//  Created by Penelope Lorrimore on 19/11/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionID {
        case 200 ... 232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...602:
            return "cloud.snow"
        case 611...622:
            return "cloud.sleet"
        case 701...711, 741:
            return "cloud.fog"
        case 721:
            return "sun.haze"
        case 731, 751...762:
            return "sun.dust"
        case 771...781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...802:
            return "cloud.sun"
        case 803...804:
            return "cloud"
        default:
            return "sparkles"
        }
    }
}
