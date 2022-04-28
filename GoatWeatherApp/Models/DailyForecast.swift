//
//  DailyForecast.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

struct DailyForecast: Codable {
    let dt: Date
    let sunrise: Date
    let sunset: Date
    let moonrise: Date
    let moonset: Date
    let moonPhase: Float
    let temp: Temperature
    let feelsLike: Temperature
    let pressure: Int
    let humidity: Float
    let dewPoint: Float
    let uvi: Float
    let clouds: Int
    let windSpeed: Float
    let windDeg: Int
    let weather: [Weather]
    let rain: Float?
    let pop: Float
    
    struct Temperature: Codable {
        let day: Float
        let min: Float?
        let max: Float?
        let night: Float
        let eve: Float
        let morn: Float
    }
}
