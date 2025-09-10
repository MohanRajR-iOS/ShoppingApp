//
//  ProductsListViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

class ProductsListViewModel: ObservableObject {

    @Published var productsList: [ProductModel]?
    @Published var isLoading: Bool = true
    @Published var error: Error?

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

    init(service: ProductsServiceProtocol = ProductsServiceManager()) {
        self.service = service
    }

     // MARK: - Get Products List from API

  @MainActor  func getAllProducts() async {

        do {
            productsList = try await service.fetchProducts()
        } catch {
            self.error = error
        }
        isLoading = false

    }
}
