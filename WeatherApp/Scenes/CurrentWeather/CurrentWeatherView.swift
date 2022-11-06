//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 25.10.2022.
//

import SwiftUI

struct CurrentWeatherView<ViewModel: CurrentWeatherViewModel>: View {
    private typealias IconName = ProjectStrings.IndicatorsIconsName

    @StateObject var viewModel: ViewModel
    @State private var showingAlert = false

    var colorScheme: ColorScheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            weatherDataView
        }
        .gradientBackground(colorScheme: colorScheme)
        .refreshable {
            viewModel.fetchCurrentWeatherData()
        }
        .alert(ProjectStrings.Alert.message, isPresented: $showingAlert) {
            Button(ProjectStrings.Alert.buttonLabel, role: .cancel) {
                showingAlert = false
            }
        }
    }

    private var weatherDataView: some View {
        VStack {
            shareButton
                .padding(.bottom, 120)

            Text(viewModel.weatherStatus)
                .font(.largeTitle)
                .bold()
                .padding(.horizontal, 32)
                .padding(.bottom, 64)
                .frame(maxWidth: .infinity, alignment: .leading)
                .redacted(reason: viewModel.isLoading ? .placeholder : [])

            IndicatorsView(
                iconName: viewModel.currentIconName,
                value: viewModel.currentTemperature,
                label: viewModel.place,
                isMainIndicator: true,
                isLoading: viewModel.isLoading
            )
            .padding(.trailing, 80)
            .frame(width: 360)

            Divider()
                .padding(.horizontal)

            HStack(
                alignment: .lastTextBaseline,
                spacing: 32
            ) {
                IndicatorsView(
                    iconName: IconName.humidity,
                    value: viewModel.humidityValue,
                    label: ProjectStrings.Indicators.humidity,
                    isMainIndicator: false,
                    isLoading: viewModel.isLoading
                )

                IndicatorsView(
                    iconName: IconName.precipitation,
                    value: viewModel.precipitationValue,
                    label: ProjectStrings.Indicators.precipitation,
                    isMainIndicator: false,
                    isLoading: viewModel.isLoading
                )

                IndicatorsView(
                    iconName: IconName.pressure,
                    value: viewModel.pressureValue,
                    label: ProjectStrings.Indicators.pressure,
                    isMainIndicator: false,
                    isLoading: viewModel.isLoading
                )
            }
            .padding(.leading, 48)
            .frame(width: 360, height: 100)

            HStack(
                alignment: .lastTextBaseline,
                spacing: 32
            ) {
                IndicatorsView(
                    iconName: IconName.wind,
                    value: viewModel.windSpeedValue,
                    label: ProjectStrings.Indicators.wind,
                    isMainIndicator: false,
                    isLoading: viewModel.isLoading
                )
                .padding(.leading, 8)

                IndicatorsView(
                    iconName: IconName.direction,
                    value: viewModel.windDirectionValue,
                    label: ProjectStrings.Indicators.direction,
                    isMainIndicator: false,
                    isLoading: viewModel.isLoading
                )
                .padding(.trailing, 138)
            }
            .padding(.leading, 48)
            .frame(width: 360, height: 100)

            Divider()
                .padding(.horizontal)
        }
    }

    private var shareButton: some View {
        Button {
            let image = weatherDataView.snapshot()
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            showingAlert = true
        } label: {
            Text(ProjectStrings.ShareButton.buttonLabel)
                .font(.system(size: 16))
                .bold()
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 70, height: 25)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
        }
        .position(x: 336, y: 20)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    private final class MockViewModel: CurrentWeatherViewModel {
        var weatherStatus: String = "Overcast clouds"
        var currentIconName: String = "TodayCloudy"
        var currentTemperature: String = "15 ºC"
        var place: String = "Mumbai, India"
        var humidityValue: String = "90 %"
        var precipitationValue: String = "1.0 MM"
        var pressureValue: String = "1014 hPa"
        var windSpeedValue: String = "11 KM/H"
        var windDirectionValue: String = "East"
        var isLoading: Bool = false

        func fetchCurrentWeatherData() {}
    }

    static var previews: some View {
        CurrentWeatherView(viewModel: MockViewModel(), colorScheme: .light)
    }
}
