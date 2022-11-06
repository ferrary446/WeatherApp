//
//  ForecastWeatherView.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 28.10.2022.
//

import SwiftUI

struct ForecastWeatherView<ViewModel: ForecastWeatherViewModel>: View {
    @StateObject var viewModel: ViewModel

    var colorScheme: ColorScheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(viewModel.cityName)
                Text(viewModel.countryName)
                Text(viewModel.currentDate)
                    .padding(.bottom, 32)

                Divider()

                ForEach(viewModel.weatherData) {
                    ItemView(model: $0)

                    if $0 != viewModel.weatherData.last {
                        Divider()
                    }
                }
            }
            .frame(width: 336)
        }
        .gradientBackground(colorScheme: colorScheme)
        .statusBarHidden()
    }
}
