//
//  Product.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation

// MARK: - Product
struct Product: Codable, Identifiable, Sendable {
    let id: Int
    let title: String
    let category: String
    let image: String
}
