//
//  ItemView.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 30.10.2022.
//

import SwiftUI

struct ItemView: View {
    let model: ItemModel

    var body: some View {
        HStack(alignment: .center) {
            Text(model.currentDate)
            Spacer()
            Image(model.iconName)
                .resizable()
                .frame(maxWidth: 24, maxHeight: 24)

            Text("\(model.minTemperature) / \(model.maxTemperature) ºC")
                .frame(minWidth: 80, maxHeight: 50)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let date: Int64 = 1667574000
        ItemView(model: ItemModel(
            currentDate: date.convertToDateString(dateFormat: .fullDate),
            iconName: "ForecastCloudy",
            minTemperature: 40,
            maxTemperature: 40
        ))
    }
}
