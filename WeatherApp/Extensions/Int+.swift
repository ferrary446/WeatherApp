//
//  Date+.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 30.10.2022.
//

import Foundation

extension Int64 {
    enum DateFormat: String {
        case date = "dd.MM.yyyy, EEEE"
        case fullDate = "dd.MM.yyyy\nEEEE\nHH:mm"
    }

    func convertToDateString(dateFormat: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = dateFormat.rawValue
        dateFormatter.timeZone = .current

        return dateFormatter.string(from: date)
    }
}
