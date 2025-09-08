//
//  ProductDetailViewModelTests.swift
//  ShoppingAppTests
//
//  Created by Mohan raj on 08/09/25.
//

import XCTest
@testable import ShoppingApp

final class ProductDetailViewModelTests: XCTestCase {
    
    var viewModel: ProductDetailViewModel!
    var mockService: MockProductsService!

    override func setUp() {
        super.setUp()
        mockService = MockProductsService()
        viewModel = ProductDetailViewModel(service: mockService)
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
        viewModel.error = NetworkError.badResponse
        XCTAssertEqual(viewModel.errorMessage, AppCommon.Error.unableToFetchData)
    }

    func testFetchProductDetailsSuccess() async {
        
        let mockProduct = ProductDetailObject(id: 222,
                                              title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                                              price: 109.95,
                                              summary: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                                              category: "men's clothing",
                                              image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                                              rating: RatingObject(rate: 3.9, count: 120))
        
        
        mockService.productDetail = mockProduct
        viewModel = ProductDetailViewModel(service: mockService)
        
        await viewModel.getProductDetails(productId: 1)
        
        XCTAssertEqual(viewModel.productDetail?.id, mockProduct.id)
        XCTAssertEqual(viewModel.productDetail?.title, mockProduct.title)
        XCTAssertEqual(viewModel.productDetail?.price, mockProduct.price)
        XCTAssertEqual(viewModel.productDetail?.summary, mockProduct.summary)
        XCTAssertEqual(viewModel.productDetail?.category, mockProduct.category)
        XCTAssertEqual(viewModel.productDetail?.image, mockProduct.image)
        XCTAssertEqual(viewModel.productDetail?.rating.rate, mockProduct.rating.rate)
        XCTAssertEqual(viewModel.productDetail?.rating.count, mockProduct.rating.count)
    }

    func testFetchProductDetailsFailure() async {
        
        mockService.shouldThrowError = true
        viewModel = ProductDetailViewModel(service: mockService)
        
        await viewModel.getProductDetails(productId: 1)
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.error)
        XCTAssertNil(viewModel.productDetail)
    }

}
