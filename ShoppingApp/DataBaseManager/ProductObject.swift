//
//  ProductObject.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation
import SwiftData


// MARK: - Product
@Model final class ProductObject: Sendable {
    
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
