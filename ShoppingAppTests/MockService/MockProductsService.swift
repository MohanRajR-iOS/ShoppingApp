//
//  MockProductsService.swift
//  ShoppingAppTests
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation
@testable import ShoppingApp

@MainActor
final class MockProductsService: ProductsServiceProtocol {

    var shouldThrowError = false
    var mockProducts: [Product]?
    var productDetail: ProductDetail?

    func fetchProducts() async throws -> [Product]? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return mockProducts ?? []
    }

    func fetchProductDetail(productId: Int) async throws -> ProductDetail? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return productDetail
    }

}
