//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

// MARK: - ProductDetail
struct ProductDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}
