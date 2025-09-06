//
//  AppCommon.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import Foundation


struct AppCommon {
    
    static let baseURL = "https://fakestoreapi.com"

    struct Endpoints {
        static let products = "/products"
        static let productWithId = "/products/%@"
    }
    
    struct Error {
        static let noProductsFound = "No products found"
        static let defaultErrorMessage = "Something went wrong!!!"
        static let unableToFetchData = "Unable to fetch data"
    }
    
    struct Images {
        static let ratingImage = "star.fill"
        static let cartImage = "cart.fill"
        static let errorImage = "exclamationmark.triangle.fill"
    }
    
    static let ProductListTitle = "Product List"
    static let ProductDetailTitle = "Product Details"
    static let ProductTotalPrice = "Total Price"
    static let ProductAddCart = "Add to Cart"
    static let cartSuccessMessage = "This product is added to your cart."
    static let loading = "Loading..."

}
