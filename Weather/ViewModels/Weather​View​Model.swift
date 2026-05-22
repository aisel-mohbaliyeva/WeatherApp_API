//
//  Weather​View​Model.swift
//  Weather
//
//  Created by Aysel Mohbaliyeva on 22.05.26.
//

import Foundation

@Observable
class WeatherViewModel {
    var weather: WeatherResponse?
    var cityName: String = ""
    var isLoading = false
    var errorMessage: String?

    private let service = WeatherService()

    func searchWeather() async {
        isLoading = true
        errorMessage = nil

        do {
            weather = try await service.fetchWeather(for: cityName)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
