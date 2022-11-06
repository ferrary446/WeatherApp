//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 25.10.2022.
//

import CoreLocation
import Foundation

final class NetworkManager: NSObject {
    private var currentWeather: ((CurrentWeatherResponse) -> Void)?
    private var forecastWeather: ((ForecastWeatherResponse) -> Void)?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func fetchCurrentWeatherData(
        _ currentWeather: @escaping (CurrentWeatherResponse) -> Void
    ) {
        self.currentWeather = currentWeather
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func fetchForecastWeatherData(
        _ forecastWeather: @escaping (ForecastWeatherResponse) -> Void
    ) {
        self.forecastWeather = forecastWeather
    }
}

private enum WeatherType: String {
    case current = "weather"
    case forecast = "forecast"
}

// MARK: - Location Delegates Methods
extension NetworkManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            currentWeatherData(
                latitude: location.latitude.formatted(),
                longitude: location.longitude.formatted()
            )

            forecastWeatherData(
                latitude: location.latitude.formatted(),
                longitude: location.longitude.formatted()
            )

            locationManager.stopUpdatingLocation()
        } else {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error.localizedDescription)")
    }
}

// MARK: - Network Methods
private extension NetworkManager {
    func currentWeatherData(latitude: String, longitude: String) {
        URLSession.shared.response(
            url: weatherURL(
                weatherType: .current,
                latitude: latitude,
                longitude: longitude
            ),
            expecting: CurrentWeatherResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let currentWeatherData):
                DispatchQueue.main.async {
                    self?.currentWeather?(currentWeatherData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func forecastWeatherData(latitude: String, longitude: String) {
        URLSession.shared.response(
            url: weatherURL(
                weatherType: .forecast,
                latitude: latitude,
                longitude: longitude
            ),
            expecting: ForecastWeatherResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let forecastWeatherData):
                DispatchQueue.main.async {
                    self?.forecastWeather?(forecastWeatherData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - URL
private extension NetworkManager {
    func weatherURL(weatherType: WeatherType, latitude: String, longitude: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/\(weatherType.rawValue)"
        components.queryItems = [
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude),
            URLQueryItem(name: "appid", value: APIKey.key),
            URLQueryItem(name: "units", value: "metric")
        ]

        return components.url
    }
}
