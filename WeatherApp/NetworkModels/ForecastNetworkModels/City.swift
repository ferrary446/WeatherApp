//
//  City.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

struct City: Decodable {
    let name: String
    let country: String
    let timezone: Int
    let sunrise: Int64
    let sunset: Int64
}
