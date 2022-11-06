//
//  ForecastWeatherIndicators.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

struct ForecastWeatherIndicators: Decodable {
    let currentDate: Int64
    let mainIndicators: ForecastMainIndicators
    let weatherIndicators: [WeatherIndicators]
    let windIndicators: WindIndicators
    let precipitation: Double

    enum CodingKeys: String, CodingKey {
        case currentDate = "dt"
        case mainIndicators = "main"
        case weatherIndicators = "weather"
        case windIndicators = "wind"
        case precipitation = "pop"
    }
}
