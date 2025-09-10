//
//  ProductsServiceManager.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation

protocol ProductsServiceProtocol {
    func fetchProducts() async throws -> [ProductModel]?
    func fetchProductDetail(productId: Int) async throws -> ProductDetailModel?
}

class ProductsServiceManager: ProductsServiceProtocol {

    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {

        self.apiService = apiService
    }

    // MARK: - Fetch Products List

    func fetchProducts() async throws -> [ProductModel]? {

        if let products: [ProductModel] = await DataBaseManager.shared.getAllProductList(), products.count > 0 {
            return products
        }

        guard let url = URL(string: AppConstants.baseURL + AppConstants.Endpoints.products) else {
            throw NetworkError.badUrl
        }

        do {
            let downloadedProducts: [Product] = try await apiService.downloadData(url: url)
            await DataBaseManager.shared.saveProductList(productList: downloadedProducts)
            return await DataBaseManager.shared.getAllProductList()
        } catch {
            throw error
        }
    }

    // MARK: - Fetch product detail with product id

    func fetchProductDetail(productId: Int) async throws -> ProductDetailModel? {

        if let product: ProductDetailModel = await DataBaseManager.shared.getProductDetail(productId: productId) {
            return product
        }

        let urlPath = String(format: AppConstants.baseURL + AppConstants.Endpoints.productWithId, "\(productId)")

        guard let url = URL(string: urlPath) else {
            throw NetworkError.badUrl
        }

        do {
            let downloadedProduct: ProductDetail =  try await apiService.downloadData(url: url)
            await DataBaseManager.shared.saveProductDetail(detail: downloadedProduct)
            return await DataBaseManager.shared.getProductDetail(productId: productId)
        } catch {
            throw error
        }
    }
}
