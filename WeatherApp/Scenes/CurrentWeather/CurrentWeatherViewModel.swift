//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 25.10.2022.
//

import Foundation
import SwiftUI

protocol CurrentWeatherViewModel: ObservableObject {
    var weatherStatus: String { get }

    var currentIconName: String { get }
    var currentTemperature: String { get }
    var place: String { get }

    var humidityValue: String { get }
    var precipitationValue: String { get }
    var pressureValue: String { get }
    var windSpeedValue: String { get }
    var windDirectionValue: String { get }

    var isLoading: Bool { get }

    func fetchCurrentWeatherData()
}

final class CurrentWeatherViewModelImp: CurrentWeatherViewModel {
    private typealias IconsStrings = ProjectStrings.TodayIcons

    @Published var weatherStatus: String = ""

    @Published var currentIconName: String = ""
    @Published var currentTemperature: String = ""
    @Published var place: String = ""

    @Published var humidityValue: String = ""
    @Published var precipitationValue: String = ""
    @Published var pressureValue: String = ""
    @Published var windSpeedValue: String = ""
    @Published var windDirectionValue: String = ""

    @Published var isLoading: Bool = false

    private let forecastStorage: ForecastWeatherStorage
    private let networkManager: NetworkManager

    init(
        forecastStorage: ForecastWeatherStorage,
        networkManager: NetworkManager
    ) {
        self.forecastStorage = forecastStorage
        self.networkManager = networkManager

        fetchCurrentWeatherData()
        fetchForecastWeatherData()
    }

    func fetchCurrentWeatherData() {
        isLoading = true
        networkManager.fetchCurrentWeatherData { [weak self] data in
            data.weatherIndicators.forEach {
                self?.weatherStatus = $0.description.toCurrentWeatherMainLabel()
                self?.handleIcons(weatherCode: $0.id)
            }

            self?.forecastStorage.currentDate = data.currentDate.convertToDateString(dateFormat: .date)

            self?.currentTemperature = Int(data.mainIndicators.temperature).description.toTemperatureLabel()
            self?.place = "\(data.cityName), \(data.systemIndicators.country.toCountryName())"

            self?.humidityValue = data.mainIndicators.humidity.description.toHumidityLabel()
            self?.pressureValue = data.mainIndicators.pressure.description.toPressureLabel()
            self?.windSpeedValue = Int(data.windIndicators.windSpeed * 3.6).description.toWindSpeedLabel()

            self?.handleWindDirection(windDegrees: data.windIndicators.windDegrees)
            self?.isLoading = false
        }
    }

    func fetchForecastWeatherData() {
        isLoading = true
        networkManager.fetchForecastWeatherData { [weak self] data in
            let precipitation = data.weatherList.first?.precipitation.description ?? "..."

            self?.precipitationValue = precipitation.toPrecipitationLabel()
            self?.forecastStorage.cityData = data.city
            self?.forecastStorage.weatherIndicatorsData = data.weatherList
            self?.isLoading = false
        }
    }
}

private extension CurrentWeatherViewModelImp {
    func handleIcons(weatherCode: Int) {
        switch weatherCode {
        case 200...232:
            currentIconName = IconsStrings.thunderstorm
        case 300...321:
            currentIconName = IconsStrings.showers
        case 500...531:
            currentIconName = IconsStrings.rain
        case 600...622:
            currentIconName = IconsStrings.snow
        case 701...781:
            currentIconName = IconsStrings.mist
        case 801:
            currentIconName = IconsStrings.fewCloudsSun
        case 802, 804:
            currentIconName = IconsStrings.cloudy
        case 803:
            currentIconName = IconsStrings.brokenClouds
        default:
            currentIconName = IconsStrings.sun
        }
    }

    func handleWindDirection(windDegrees: Int) {
        switch windDegrees {
        case 0:
            windDirectionValue = ProjectStrings.WindDirections.north
        case 1...89:
            windDirectionValue = ProjectStrings.WindDirections.northEast
        case 90:
            windDirectionValue = ProjectStrings.WindDirections.east
        case 91...179:
            windDirectionValue = ProjectStrings.WindDirections.southEast
        case 180:
            windDirectionValue = ProjectStrings.WindDirections.south
        case 181...269:
            windDirectionValue = ProjectStrings.WindDirections.southWest
        case 270:
            windDirectionValue = ProjectStrings.WindDirections.west
        case 271...359:
            windDirectionValue = ProjectStrings.WindDirections.northWest
        case 360:
            windDirectionValue = ProjectStrings.WindDirections.north
        default:
            windDirectionValue = ProjectStrings.Loading.label
        }
    }
}
