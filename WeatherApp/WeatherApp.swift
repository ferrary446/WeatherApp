//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 25.10.2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            MainWeatherView(viewModel: MainWeatherViewModelImp())
        }
    }
}
