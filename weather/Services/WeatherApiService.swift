//
//  WeatherApiService.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation
import Alamofire

class WeatherApiService {

    static func show(city: String) async -> Result<WeatherResult, AFError>? {
        guard let query: String = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let local = Locale.current.language.languageCode,
              let apiKey = ProcessInfo.processInfo.environment["WEATHER_API_KEY"] else { return nil }
        let dataTask = AF.request(
            "https://api.openweathermap.org/data/2.5/weather?q=\(query)" +
            "&lang=\(local)" +
            "&appid=\(apiKey)&units=metrics")
            .serializingDecodable(WeatherResult.self)
        return await dataTask.result
    }
}
