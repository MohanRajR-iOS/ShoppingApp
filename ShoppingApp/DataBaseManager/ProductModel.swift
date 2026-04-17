//
//  ProductModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation
import SwiftData

// MARK: - Product
@Model final class ProductModel {

    @Attribute(.unique)  var id: Int
    var title: String
    var category: String
    var image: String

    init(id: Int, title: String, category: String, image: String) {
        self.id = id
        self.title = title
        self.category = category
        self.image = image
    }
}

extension ProductModel {
    func productModelToProduct() -> Product {
        Product(
            id: id,
            title: title,
            category: category,
            image: image
        )
    }
}
