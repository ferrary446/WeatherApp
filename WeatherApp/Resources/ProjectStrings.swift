//
//  ProjectStrings.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import Foundation

enum ProjectStrings {
    enum Loading {
        static var label: String {
            return "..."
        }
    }

    enum Alert {
        static var message: String {
            return "Weather data have been saved to your gallery"
        }

        static var buttonLabel: String {
            return "OK"
        }
    }

    enum TabBar {
        enum CurrentWeather {
            static var labelName: String {
                return "Today"
            }

            static var imageName: String {
                return "TabBarToday"
            }
        }

        enum ForecastWeather {
            static var labelName: String {
                return "Forecast"
            }

            static var imageName: String {
                return "TabBarForecast"
            }
        }
    }

    enum Indicators {
        static var humidity: String {
            return "Humidity"
        }

        static var precipitation: String {
            return "Precipitation"
        }

        static var pressure: String {
            return "Pressure"
        }

        static var wind: String {
            return "Wind"
        }

        static var direction: String {
            return "Direction"
        }
    }

    enum WindDirections {
        static var north: String {
            return "North"
        }

        static var east: String {
            return "East"
        }

        static var south: String {
            return "South"
        }

        static var west: String {
            return "West"
        }

        static var northEast: String {
            return "North-East"
        }

        static var northWest: String {
            return "North-West"
        }

        static var southEast: String {
            return "South-East"
        }

        static var southWest: String {
            return "South-West"
        }
    }

    enum IndicatorsIconsName {
        static var humidity: String {
            return "TodayHumidity"
        }

        static var precipitation: String {
            return "TodayPrecipitation"
        }

        static var pressure: String {
            return "TodayPressure"
        }

        static var wind: String {
            return "TodayWindSpeed"
        }

        static var direction: String {
            return "TodayWindDirection"
        }
    }

    enum ShareButton {
        static var buttonLabel: String {
            return "Share"
        }
    }

    enum TodayIcons {
        static var thunderstorm: String {
            return "TodayThunderstorm"
        }

        static var showers: String {
            return "TodayShowers"
        }

        static var rain: String {
            return "TodayRain"
        }

        static var snow: String {
            return "TodaySnow"
        }

        static var mist: String {
            return "TodayMist"
        }

        static var fewCloudsSun: String {
            return "TodayFewCloudsSun"
        }

        static var cloudy: String {
            return "TodayCloudy"
        }

        static var brokenClouds: String {
            return "TodayBrokenClouds"
        }

        static var sun: String {
            return "TodaySun"
        }
    }

    enum ForecastIcons {
        static var thunderstorm: String {
            return "ForecastThunderstorm"
        }

        static var showers: String {
            return "ForecastShowers"
        }

        static var rain: String {
            return "ForecastRain"
        }

        static var snow: String {
            return "ForecastSnow"
        }

        static var mist: String {
            return "ForecastMist"
        }

        static var fewCloudsSun: String {
            return "ForecastFewCloudsSun"
        }

        static var cloudy: String {
            return "ForecastCloudy"
        }

        static var brokenClouds: String {
            return "ForecastBrokenClouds"
        }

        static var sun: String {
            return "ForecastSun"
        }
    }
}
