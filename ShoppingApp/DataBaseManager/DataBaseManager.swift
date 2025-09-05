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
        let schema = Schema([ ProductObject.self,
                            ])
        self.sharedModelContainer = try? ModelContainer(for: schema)
    }
    
    var modelContext: ModelContext? {
        sharedModelContainer?.mainContext
    }
    
    func saveProductList(productList: [Product]) async {
        
        for product in productList {
            let itemToStore = ProductObject(id: product.id, title: product.title, category: product.category, image: product.image)
            modelContext?.insert(itemToStore)
            try? modelContext?.save()
        }
    }
    
    func getAllProductList() async -> [ProductObject]? {
        
        let fetchDescriptor = FetchDescriptor<ProductObject>()
        
        guard let products = try? modelContext?.fetch(fetchDescriptor) else {
            return nil
        }
        
        return products
    }
}
