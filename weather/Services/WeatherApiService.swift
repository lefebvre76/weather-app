//
//  WeatherApiService.swift
//  weather
//
//  Created by Loïc Levebvre on 10/11/2023.
//

import Foundation
import Alamofire

class WeatherApiService {

    private static let apiKey = "API_KEY"

    static func show(city: String) async -> Result<WeatherResult, AFError>? {
        guard let query: String = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return nil }
        let dataTask = AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(query)&appid=\(apiKey)")
            .serializingDecodable(WeatherResult.self)
        return await dataTask.result
    }
}
