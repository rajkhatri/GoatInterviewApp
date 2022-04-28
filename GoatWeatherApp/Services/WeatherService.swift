//
//  WeatherService.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

struct WeatherService {
 
    private let oneCallURL = URL(string: "https://api.openweathermap.org/data/2.5/onecall")!
    
    func getDailyWeather(lat: String, lon: String) async throws -> WeatherData {
        let url = oneCallURL
                    .appendingQueryItem("lat", value: lat)
                    .appendingQueryItem("lon", value: lon)
                    .appendingQueryItem("exclude", value: "hourly,minutely,alerts")
                    .appendingQueryItem("units", value: "imperial")
                    .appendingQueryItem("appid", value: Constants.Weather.appId)
                                
        let urlRequest = URLRequest(url: url)
        return try await NetworkingService.shared.request(urlRequest)
    }
}
