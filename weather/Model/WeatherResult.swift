//
//  Weather.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation

class WeatherResult: Decodable {
    var weather: [Weather]
    var main: Main
    var city: String?
    
    init (weather: Weather, main: Main, city: String) {
        self.weather = [weather]
        self.main = main
        self.city = city
    }
    
    func getIcon() -> String {
        if let weatherId = weather.first?.id {
            if weatherId < 300 {
                return "cloud.bolt"
            }
            if weatherId < 400 {
                return "cloud.drizzle"
            }
            if weatherId <= 504 {
                return "cloud.sun.rain"
            }
            if weatherId == 511 {
                return "snowflake"
            }
            if weatherId < 600 {
                return "cloud.drizzle"
            }
            if weatherId < 700 {
                return "snowflake"
            }
            if weatherId < 800 {
                return "cloud.fog"
            }
            if weatherId == 800 {
                return "sun.max"
            }
            if weatherId == 801 {
                return "cloud.sun"
            }
            return "smoke"
        }
        return "questionmark.circle"
    }
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}
