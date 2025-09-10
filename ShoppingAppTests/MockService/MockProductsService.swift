//
//  MockProductsService.swift
//  ShoppingAppTests
//
//  Created by Mohan raj on 10/09/25.
//

import Foundation
@testable import ShoppingApp

class MockProductsService: ProductsServiceProtocol {

    var shouldThrowError = false
    var mockProducts: [ProductModel]?
    var productDetail: ProductDetailModel?

    func fetchProducts() async throws -> [ProductModel]? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return mockProducts ?? []
    }

    func fetchProductDetail(productId: Int) async throws -> ProductDetailModel? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return productDetail
    }

}
