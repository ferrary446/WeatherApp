//
//  IndicatorsView.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import SwiftUI

struct IndicatorsView: View {
    let iconName: String
    let value: String
    let label: String
    let isMainIndicator: Bool
    let isLoading: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if isMainIndicator {
                Image(iconName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 16)
                    .redacted(reason: isLoading ? .placeholder : [])
            } else {
                Image(iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .background {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                    }
                    .padding(.bottom, 16)
            }

            if isMainIndicator {
                Text(value)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 8)
                    .redacted(reason: isLoading ? .placeholder : [])
            } else {
                Text(value)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .redacted(reason: isLoading ? .placeholder : [])
            }

            if isMainIndicator {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .redacted(reason: isLoading ? .placeholder : [])
            } else {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(
            width: isMainIndicator ? 250 : 100,
            height: isMainIndicator ? 150 : 100
        )
    }
}

struct IndicatorsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center) {
            IndicatorsView(
                iconName: "TodaySnow",
                value: "15 ºC",
                label: "Johannesburg, Czech Republic",
                isMainIndicator: true,
                isLoading: false
            )

            IndicatorsView(
                iconName: "TodayHumidity",
                value: "90 %",
                label: "Humidity",
                isMainIndicator: false,
                isLoading: false
            )
        }
    }
}
