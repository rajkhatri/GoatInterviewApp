//
//  NetworkingService.swift
//  GoatWeatherApp
//
//  Created by Raj Khatri on 4/27/22.
//

import Foundation

class NetworkingService: NSObject {
    
    static let shared = NetworkingService()
    typealias HTTPStatusCode = Int
    
    enum NetworkError: Error {
        case networkError(HTTPStatusCode, Data?)
        case unexpectedURLResponse
    }
    
    private var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateAsTimeInterval = try container.decode(TimeInterval.self)
            return Date(timeIntervalSince1970: dateAsTimeInterval)
        }
        return decoder
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest, delegate: self)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unexpectedURLResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.networkError(httpResponse.statusCode, data)
        }
        
        return try jsonDecoder.decode(T.self, from: data)
    }
}

extension NetworkingService: URLSessionTaskDelegate {
    // If we want to handle network errors, or any other network manipulations
}
