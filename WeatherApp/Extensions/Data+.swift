//
//  Data+.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 30.10.2022.
//

import Foundation

extension Data {
    func printJSON() {
        guard let json = String(data: self, encoding: String.Encoding.utf8) else { return }
        print(json)
    }
}
