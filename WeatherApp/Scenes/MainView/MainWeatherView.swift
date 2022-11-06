//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import SwiftUI

struct MainWeatherView<ViewModel: MainWeatherViewModel>: View {
    private typealias Strings = ProjectStrings.TabBar

    @Environment(\.colorScheme) var colorScheme

    @StateObject var viewModel: ViewModel
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CurrentWeatherView(viewModel: viewModel.currentWeatherViewModel, colorScheme: colorScheme)
                .tabItem {
                    Label(Strings.CurrentWeather.labelName, image: Strings.CurrentWeather.imageName)
                }
                .tag(1)

            ForecastWeatherView(viewModel: viewModel.forecastWeatherViewModel, colorScheme: colorScheme)
                .tabItem {
                    Label(Strings.ForecastWeather.labelName, image: Strings.ForecastWeather.imageName)
                }
                .tag(2)
        }
    }
}
