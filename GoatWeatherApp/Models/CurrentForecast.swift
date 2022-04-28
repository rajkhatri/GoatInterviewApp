//
//  CurrentForecast.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

struct CurrentForecast: Codable {
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let temp: Float
    let feelsLike: Float
    let pressure: Int
    let humidity: Float
    let dewPoint: Float
    let uvi: Float
    let clouds: Int
    let visibility: Int
    let windSpeed: Float
    let windDeg: Int
    let weather: [Weather]
    let rain: Rain?
    
    struct Rain: Codable {
        let lh: Float
    }
}
