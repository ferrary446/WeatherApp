//
//  ForecastMainIndicators.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

struct ForecastMainIndicators: Decodable {
    let minTemperature: Double
    let maxTemperature: Double

    enum CodingKeys: String, CodingKey {
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
}
