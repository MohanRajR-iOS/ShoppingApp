//
//  Product.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let category: String
    let image: String
}
