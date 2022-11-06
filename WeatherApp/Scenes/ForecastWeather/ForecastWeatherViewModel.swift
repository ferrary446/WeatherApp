//
//  ForecastWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Foundation

protocol ForecastWeatherViewModel: ObservableObject {
    var cityName: String { get }
    var countryName: String { get }
    var currentDate: String { get }

    var weatherData: [ItemModel] { get }
}

final class ForecastWeatherViewModelImp: ForecastWeatherViewModel {
    private typealias IconsStrings = ProjectStrings.ForecastIcons

    @Published var cityName: String = ""
    @Published var countryName: String = ""
    @Published var currentDate: String = ""
    @Published var weatherData: [ItemModel] = []

    private let forecastStorage: ForecastWeatherStorage

    init(forecastStorage: ForecastWeatherStorage) {
        self.forecastStorage = forecastStorage
        bindingStorageData()
    }
}

private extension ForecastWeatherViewModelImp {
    func bindingStorageData() {
        forecastStorage.observeCityData()
            .map(\.name)
            .assign(to: &$cityName)

        forecastStorage.observeCityData()
            .map { $0.country.toCountryName() }
            .assign(to: &$countryName)

        forecastStorage.observeCurrentDate()
            .assign(to: &$currentDate)

        forecastStorage.observeWeatherIndicatorsData()
            .map {
                let itemModels: [ItemModel] = $0.map { [weak self] data in
                    ItemModel(
                        currentDate: data.currentDate.convertToDateString(dateFormat: .fullDate),
                        iconName: self?.handleIcons(weatherCode: data.weatherIndicators.first?.id ?? .zero) ?? "",
                        minTemperature: Int(data.mainIndicators.minTemperature),
                        maxTemperature: Int(data.mainIndicators.maxTemperature)
                    )
                }

                return itemModels
            }
            .assign(to: &$weatherData)
    }

    func handleIcons(weatherCode: Int) -> String {
        switch weatherCode {
        case 200...232:
            return IconsStrings.thunderstorm
        case 300...321:
            return IconsStrings.showers
        case 500...531:
            return IconsStrings.rain
        case 600...622:
            return IconsStrings.snow
        case 701...781:
            return IconsStrings.mist
        case 801:
            return IconsStrings.fewCloudsSun
        case 802, 804:
            return IconsStrings.cloudy
        case 803:
            return IconsStrings.brokenClouds
        default:
            return IconsStrings.sun
        }
    }
}
