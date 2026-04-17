//
//  ProductsListViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation
@MainActor
@Observable
final class ProductsListViewModel {

     var productsList: [Product]?
     var isLoading: Bool = true
     var error: Error?

    var errorMessage: String {
        if productsList?.isEmpty == true {
            AppConstants.Error.noProductsFound
        } else if error != nil {
            AppConstants.Error.unableToFetchData
        } else {
            AppConstants.Error.defaultErrorMessage
        }
    }

    private let service: ProductsServiceProtocol
    
    init(service: ProductsServiceProtocol? = nil) {
        self.service = service ?? ProductsServiceManager()
    }

     // MARK: - Get Products List from API

    func getAllProducts() async {
        do {
            productsList = try await service.fetchProducts()
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
