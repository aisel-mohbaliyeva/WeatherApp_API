//
//  WeatherModel.swift.swift
//  Weather
//
//  Created by Aysel Mohbaliyeva on 22.05.26.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: MainWeather
}

struct MainWeather: Codable {
    let temp: Double
    let humidity: Int
}
