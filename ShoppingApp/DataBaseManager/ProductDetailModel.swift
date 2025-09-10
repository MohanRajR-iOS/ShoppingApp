//
//  ProductDetailModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation
import SwiftData

// MARK: - ProductDetailModel
@Model
final class ProductDetailModel: Sendable {

    @Attribute(.unique) var id: Int
    var title: String
    var price: Double
    var summary: String
    var category: String
    var image: String

    @Relationship(deleteRule: .cascade) var rating: RatingModel

    init(id: Int, title: String, price: Double, summary: String, category: String, image: String, rating: RatingModel) {
        self.id = id
        self.title = title
        self.price = price
        self.summary = summary
        self.category = category
        self.image = image
        self.rating = rating
    }
}
