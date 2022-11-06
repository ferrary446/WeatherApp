//
//  ItemModel.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 30.10.2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: UUID = UUID()
    let currentDate: String
    let iconName: String
    let minTemperature: Int
    let maxTemperature: Int
}

extension ItemModel: Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.id == rhs.id
    }
}
