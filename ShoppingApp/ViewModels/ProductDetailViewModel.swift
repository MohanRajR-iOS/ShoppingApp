//
//  ProductDetailViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

@Observable
class ProductDetailViewModel {
    
     var productDetail: ProductDetailObject?
     var isLoading: Bool = true
     var error: Error?
    
    var errorMessage: String {
        if error != nil {
            AppCommon.Error.unableToFetchData
        } else {
            AppCommon.Error.defaultErrorMessage
        }
    }
    
    private let service: ProductsServiceProtocol

    init(service: ProductsServiceProtocol = ProductsServiceManager()) {
        self.service = service
    }
    
      func getProductDetails(productId: Int) async  {
        
        do {
            productDetail = try await service.fetchProductDetail(productId: productId)
        }catch {
            self.error = error
        }
        isLoading = false
    }
}
