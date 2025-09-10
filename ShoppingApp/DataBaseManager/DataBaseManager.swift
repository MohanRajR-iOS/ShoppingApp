//
//  DataBaseManager.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation
import SwiftData

@MainActor
class DataBaseManager {
    static let shared = DataBaseManager()
    let sharedModelContainer: ModelContainer?
    private init() {
        let schema = Schema([ ProductModel.self,
                              ProductDetailModel.self
                            ])
        self.sharedModelContainer = try? ModelContainer(for: schema)
    }

    var modelContext: ModelContext? {
        sharedModelContainer?.mainContext
    }

    // MARK: - Save Products
    func saveProductList(productList: [Product]) async {

        for item in productList {
            let itemToStore = ProductModel(id: item.id, title: item.title, category: item.category, image: item.image)
            modelContext?.insert(itemToStore)
            try? modelContext?.save()
        }
    }

    // MARK: - Fetch Products
    func getAllProductList() async -> [ProductModel]? {

        let fetchDescriptor = FetchDescriptor<ProductModel>()

        guard let products = try? modelContext?.fetch(fetchDescriptor) else {
            return nil
        }

        return products
    }

    // MARK: - Save Product detail
    func saveProductDetail(detail: ProductDetail) {
        let rating = RatingModel(rate: detail.rating.rate, count: detail.rating.count)
        let itemToStore = ProductDetailModel(
            id: detail.id,
            title: detail.title,
            price: detail.price,
            summary: detail.description,
            category: detail.category,
            image: detail.image,
            rating: rating
        )
        modelContext?.insert(itemToStore)
        try? modelContext?.save()
    }

    // MARK: - Fetch Product detail
    func getProductDetail(productId: Int) -> ProductDetailModel? {

        let fetchDescriptor = FetchDescriptor<ProductDetailModel>(
            predicate: #Predicate { $0.id == productId }
        )

        guard let product = try? modelContext?.fetch(fetchDescriptor).first else {
            return nil
        }

        return product
    }
}
