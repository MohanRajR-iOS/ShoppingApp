//
//  ProductDetailViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation
@MainActor
@Observable
class ProductDetailViewModel {

    var productDetail: ProductDetail?
    var isLoading: Bool = true
    var error: Error?

    var errorMessage: String {
        if error != nil {
            AppConstants.Error.unableToFetchData
        } else {
            AppConstants.Error.defaultErrorMessage
        }
    }

    private let service: ProductsServiceProtocol
    
    init(service: ProductsServiceProtocol? = nil) {
        self.service = service ?? ProductsServiceManager()
    }

    // MARK: - Get Product details from API

    func getProductDetails(productId: Int) async {

        do {
            productDetail = try await service.fetchProductDetail(productId: productId)
        } catch {
            self.error = error
        }
        isLoading = false
    }
}

