//
//  WindIndicators.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

struct WindIndicators: Decodable {
    let windSpeed: Double
    let windDegrees: Int

    enum CodingKeys: String, CodingKey {
        case windSpeed = "speed"
        case windDegrees = "deg"
    }
}
