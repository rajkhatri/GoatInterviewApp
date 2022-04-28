//
//  WeatherViewModel.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

enum WeatherType: CaseIterable {
    case current
    case daily
}

class WeatherViewModel {
    
    var weatherData: WeatherData?
    
    var shouldShowLocationButton: Bool {
        LocationManager.shared.isLocationEnabled == false
    }
    
    func fetchWeatherData(lat: String, lon: String) async throws {
        weatherData = try await Services.weather.getDailyWeather(lat: lat, lon: lon)
    }
    
    func getNumberOfDataPoints(type: WeatherType) -> Int {
        switch type {
        case .current:
            return weatherData?.current != nil ? 1 : 0
        case .daily:
            return weatherData?.daily.count ?? 0
        }
    }
    
    func requestLocation(completion: @escaping ((lat: String, lon: String)) -> Void) {
        LocationManager.shared.requestLocation { coordinate in
            completion(("\(coordinate.latitude)", "\(coordinate.longitude)"))
        }
    }
}
