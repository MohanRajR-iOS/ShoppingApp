//
//  ProductsServiceManager.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation


protocol ProductsServiceProtocol {
    func fetchProducts() async throws -> [ProductObject]?
    func fetchProductDetail(productId: Int) async throws -> ProductDetailObject?
}

class ProductsServiceManager: ProductsServiceProtocol {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()) {
        
        self.apiService = apiService
    }
    
    // MARK: - Fetch Products List
    
    func fetchProducts() async throws -> [ProductObject]? {
        
        if let products: [ProductObject] = await DataBaseManager.shared.getAllProductList(), products.count > 0 {
            return products
        }
        
        guard let url = URL(string: AppCommon.baseURL + AppCommon.Endpoints.products) else {
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
    
    func fetchProductDetail(productId: Int) async throws -> ProductDetailObject? {
        
        
        if let product: ProductDetailObject = await DataBaseManager.shared.getProductDetail(productId: productId) {
            return product
        }
        
        let urlPath = String(format: AppCommon.baseURL + AppCommon.Endpoints.productWithId, "\(productId)")
        
        guard let url = URL(string: urlPath) else {
            throw NetworkError.badUrl
        }
        
        do {
            let downloadedProduct: ProductDetail =  try await apiService.downloadData(url: url)
            await DataBaseManager.shared.saveProductDetail(detailObject: downloadedProduct)
            return await DataBaseManager.shared.getProductDetail(productId: productId)
        } catch {
            throw error
        }
    }
}
