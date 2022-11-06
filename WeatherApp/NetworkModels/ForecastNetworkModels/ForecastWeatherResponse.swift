//
//  ForecastWeatherResponse.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

struct ForecastWeatherResponse: Decodable {
    let weatherList: [ForecastWeatherIndicators]
    let city: City

    enum CodingKeys: String, CodingKey {
        case weatherList = "list"
        case city
    }
}
