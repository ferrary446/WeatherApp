//
//  MainWeatherIndicators.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

struct MainWeatherIndicators: Decodable {
    let temperature: Double
    let feelsLikeTemperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Int
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLikeTemperature = "feels_like"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure
        case humidity
    }
}
