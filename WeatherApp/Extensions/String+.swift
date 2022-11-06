//
//  String+.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

extension String {
    var capitalizedFirstLetter: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }

    func toCurrentWeatherMainLabel() -> String {
        self.replacingOccurrences(of: " ", with: "\n").capitalizedFirstLetter
    }

    func toHumidityLabel() -> String {
        "\(self) %"
    }

    func toPrecipitationLabel() -> String {
        "\(self) MM"
    }

    func toTemperatureLabel() -> String {
        "\(self) ºC"
    }

    func toPressureLabel() -> String {
        "\(self) hPa"
    }

    func toWindSpeedLabel() -> String {
        "\(self) KM/H"
    }
}

public extension String {
    func toCountryName() -> String {
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: self) {
            // Country name was found
            return name
        } else {
            // Country name cannot be found
            return self
        }
    }
}
