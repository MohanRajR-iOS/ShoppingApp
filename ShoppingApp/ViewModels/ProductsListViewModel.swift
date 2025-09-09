//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

@Observable
 class ProductsListViewModel {
    
     var productsList: [ProductObject]?
     var isLoading: Bool = true
     var error: Error?
    
    var errorMessage: String {
        if productsList?.isEmpty == true {
            AppCommon.Error.noProductsFound
        } else if error != nil {
            AppCommon.Error.unableToFetchData
        } else {
            AppCommon.Error.defaultErrorMessage
        }
    }
    
    private let service: ProductsServiceProtocol

    init(service: ProductsServiceProtocol = ProductsServiceManager()) {
        self.service = service
    }
     
     // MARK: - Get Products List from API
    
    func getAllProducts() async  {
        
        do {
            productsList = try await service.fetchProducts()
        } catch {
            self.error = error
        }
        isLoading = false
        
    }
}
