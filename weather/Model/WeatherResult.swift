//
//  Weather.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation

struct WeatherResult: Decodable {
    var weather: [Weather]
    var main: Main
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
