//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation

// MARK: - ProductDetail
struct ProductDetail: Codable, Identifiable, Sendable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}
