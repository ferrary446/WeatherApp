//
//  MainWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

protocol MainWeatherViewModel: ObservableObject {
    var currentWeatherViewModel: CurrentWeatherViewModelImp { get }
    var forecastWeatherViewModel: ForecastWeatherViewModelImp { get }
}

final class MainWeatherViewModelImp: MainWeatherViewModel {
    @Published var currentWeatherViewModel: CurrentWeatherViewModelImp
    @Published var forecastWeatherViewModel: ForecastWeatherViewModelImp

    private let forecastStorage = ForecastWeatherStorage()
    private let networkManager = NetworkManager()

    init() {
        currentWeatherViewModel = CurrentWeatherViewModelImp(
            forecastStorage: forecastStorage,
            networkManager: networkManager
        )

        forecastWeatherViewModel = ForecastWeatherViewModelImp(
            forecastStorage: forecastStorage
        )
    }
}
