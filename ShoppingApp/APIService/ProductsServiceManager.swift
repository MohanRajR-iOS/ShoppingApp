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
    
    func fetchProducts() async throws -> [ProductObject]? {
        
        if let products: [ProductObject] = await DataBaseManager.shared.getAllProductList(), products.count > 0 {
            return products
        }
        
        guard let downloadedProducts: [Product] =  await apiService.downloadData(fromURL: AppCommon.baseURL + AppCommon.Endpoints.products) else { return nil }
        await DataBaseManager.shared.saveProductList(productList: downloadedProducts)
        return await DataBaseManager.shared.getAllProductList()
    }
    
    func fetchProductDetail(productId: Int) async throws -> ProductDetailObject? {
        
        
        if let product: ProductDetailObject = await DataBaseManager.shared.getProductDetail(productId: productId) {
            return product
        }
        
        let urlPath = String(format: AppCommon.baseURL + AppCommon.Endpoints.productWithId, "\(productId)")
        guard let downloadedProduct: ProductDetail =  await apiService.downloadData(fromURL: urlPath) else {return nil}
        await DataBaseManager.shared.saveProductDetail(detailObject: downloadedProduct)
        return await DataBaseManager.shared.getProductDetail(productId: productId)
    }
}
