//
//  ForecastWeatherStorage.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import Combine
import Foundation

final class ForecastWeatherStorage {
    private let weatherIndicatorsDataSubject = CurrentValueSubject<[ForecastWeatherIndicators]?, Never>(nil)
    private let cityDataSubject = CurrentValueSubject<City?, Never>(nil)
    private let currentDateSubject = CurrentValueSubject<String?, Never>(nil)

    var weatherIndicatorsData: [ForecastWeatherIndicators]? {
        get { weatherIndicatorsDataSubject.value }
        set { weatherIndicatorsDataSubject.send(newValue) }
    }

    var cityData: City? {
        get { cityDataSubject.value }
        set { cityDataSubject.send(newValue) }
    }

    var currentDate: String? {
        get { currentDateSubject.value }
        set { currentDateSubject.send(newValue) }
    }

    init() {}

    func observeWeatherIndicatorsData() -> AnyPublisher<[ForecastWeatherIndicators], Never> {
        weatherIndicatorsDataSubject
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }

    func observeCityData() -> AnyPublisher<City, Never> {
        cityDataSubject
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }

    func observeCurrentDate() -> AnyPublisher<String, Never> {
        currentDateSubject
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
}
