//
//  Weather.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

extension Weather {
    var imageURL: URL? {
        URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
