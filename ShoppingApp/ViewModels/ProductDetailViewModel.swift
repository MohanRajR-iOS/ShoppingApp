//
//  ProductDetailViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {

    @Published var productDetail: ProductDetailModel?
    @Published var isLoading: Bool = true
    @Published var error: Error?

    var errorMessage: String {
        if error != nil {
            AppConstants.Error.unableToFetchData
        } else {
            AppConstants.Error.defaultErrorMessage
        }
    }

    private let service: ProductsServiceProtocol

    init(service: ProductsServiceProtocol = ProductsServiceManager()) {
        self.service = service
    }

    // MARK: - Get Product details from API

    @MainActor  func getProductDetails(productId: Int) async {

        do {
            productDetail = try await service.fetchProductDetail(productId: productId)
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
