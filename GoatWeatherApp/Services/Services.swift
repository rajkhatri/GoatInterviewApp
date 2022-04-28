//
//  Services.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

public enum Services {
    
    static let weather = WeatherService()
}

// We can even make the Services enum as a struct if/when we have multiple services, and want to preserve state
