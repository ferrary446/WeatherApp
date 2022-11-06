//
//  CurrentWeatherResponse.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    let weatherIndicators: [WeatherIndicators]
    let mainIndicators: MainWeatherIndicators
    let windIndicators: WindIndicators
    let currentDate: Int64
    let systemIndicators: SystemIndicators
    let timezone: Int
    let cityName: String

    enum CodingKeys: String, CodingKey {
        case weatherIndicators = "weather"
        case mainIndicators = "main"
        case windIndicators = "wind"
        case currentDate = "dt"
        case systemIndicators = "sys"
        case timezone
        case cityName = "name"
    }
}
