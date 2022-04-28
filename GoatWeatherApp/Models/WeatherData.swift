//
//  WeatherData.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

struct WeatherData: Codable {
    
    let lat: Float
    let lon: Float
    let timezone: String
    let current: CurrentForecast
    let daily: [DailyForecast]
}
