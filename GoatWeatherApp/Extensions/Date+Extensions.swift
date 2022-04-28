//
//  Date+Extensions.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

extension Date {
    
    var readable: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
