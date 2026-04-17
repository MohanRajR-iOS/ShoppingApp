//
//  ProductsServiceManager.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import Foundation

protocol ProductsServiceProtocol: Sendable {
    func fetchProducts() async throws -> [Product]?
    func fetchProductDetail(productId: Int) async throws -> ProductDetail?
}

final class ProductsServiceManager: ProductsServiceProtocol {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {

        self.apiService = apiService
    }

    // MARK: - Fetch Products List

    func fetchProducts() async throws -> [Product]? {

        if let products: [ProductModel] = await DataBaseManager.shared.getAllProductList(), products.count > 0 {
            return products.map { $0.productModelToProduct() }
        }

        guard let url = URL(string: AppConstants.baseURL + AppConstants.Endpoints.products) else {
            throw NetworkError.badUrl
        }

        do {
            let downloadedProducts: [Product] = try await apiService.downloadData(url: url)
            await DataBaseManager.shared.saveProductList(productList: downloadedProducts)
            return downloadedProducts
        } catch {
            throw error
        }
    }

    // MARK: - Fetch product detail with product id

    func fetchProductDetail(productId: Int) async throws -> ProductDetail? {

        if let product: ProductDetailModel = DataBaseManager.shared.getProductDetail(productId: productId) {
            return product.productDetailModelToProductDetail()
        }

        let urlPath = String(format: AppConstants.baseURL + AppConstants.Endpoints.productWithId, "\(productId)")

        guard let url = URL(string: urlPath) else {
            throw NetworkError.badUrl
        }

        do {
            let downloadedProduct: ProductDetail =  try await apiService.downloadData(url: url)
            DataBaseManager.shared.saveProductDetail(detail: downloadedProduct)
            return downloadedProduct
        } catch {
            throw error
        }
    }
}
