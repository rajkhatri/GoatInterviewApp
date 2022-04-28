//
//  URL+Extensions.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

extension URL {
    
    func appendingQueryItem(_ queryItem: String, value: String) -> URL {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + [URLQueryItem(name: queryItem, value: value)]
        return urlComponents.url ?? self
    }
}
