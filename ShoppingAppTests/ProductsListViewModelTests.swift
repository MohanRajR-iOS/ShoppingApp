//
//  ProductsListViewModelTests.swift
//  ShoppingAppTests
//
//  Created by Mohan raj on 08/09/25.
//

import XCTest
@testable import ShoppingApp

enum MockError: Error {
    case defaultError
}

final class ProductsListViewModelTests: XCTestCase {
    
    var viewModel: ProductsListViewModel!
    var mockService: MockProductsService!

    override func setUp() {
        super.setUp()
        mockService = MockProductsService()
        viewModel = ProductsListViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    

    func testErrorMessage() {
        // Check default error message
        XCTAssertEqual(viewModel.errorMessage, AppCommon.Error.defaultErrorMessage)

        // When there is an error
        viewModel.productsList = nil
        viewModel.error = NetworkError.badResponse
        XCTAssertEqual(viewModel.errorMessage, AppCommon.Error.unableToFetchData)

        // When the products list is empty
        viewModel.productsList = []
        viewModel.error = nil
        XCTAssertEqual(viewModel.errorMessage, AppCommon.Error.noProductsFound)
    }

    
    func testLoadProductsSuccess() async {
        
        let mockProducts = [
            ProductObject(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png"),
            ProductObject(id: 2, title: "Mens Casual Premium Slim Fit T-Shirts ", category: "men's clothing", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png")
        ]
        mockService.mockProducts = mockProducts
        viewModel = ProductsListViewModel(service: mockService)

        await viewModel.getAllProducts()
        
        print(viewModel.productsList?.count ?? 0)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.productsList?.count, mockProducts.count)
    }
    
    

    func testLoadProductFailure() async {
        mockService.shouldThrowError = true
        viewModel = ProductsListViewModel(service: mockService)
        
        await viewModel.getAllProducts()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.error)
        XCTAssertNil(viewModel.productsList)
    }

}


class MockProductsService: ProductsServiceProtocol {
    
    var shouldThrowError = false
    var mockProducts: [ProductObject]?
    var productDetail: ProductDetailObject?
    
    func fetchProducts() async throws -> [ProductObject]? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return mockProducts ?? []
    }
    
    func fetchProductDetail(productId: Int) async throws -> ProductDetailObject? {
        if shouldThrowError {
            throw MockError.defaultError
        }
        return productDetail
    }
    
}
