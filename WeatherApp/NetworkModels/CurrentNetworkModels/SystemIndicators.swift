//
//  SystemIndicators.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

struct SystemIndicators: Decodable {
    let country: String
    let sunriseTime: Int64
    let sunsetTime: Int64

    enum CodingKeys: String, CodingKey {
        case country
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
    }
}
