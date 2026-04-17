//
//  APIService.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

protocol APIServiceProtocol: Sendable {
    func downloadData<T: Codable>(url: URL) async throws -> T
}

final class APIService: APIServiceProtocol, Sendable {
    func downloadData<T: Codable>(url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        
        guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw NetworkError.badStatus
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.failedToDecodeResponse
        }
    }
    
}

