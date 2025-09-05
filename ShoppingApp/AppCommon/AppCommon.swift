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
    }
    
    struct Error {
        static let noProductsFound = "No products found"
        static let defaultErrorMessage = "Something went wrong!!!"
        static let unableToFetchData = "Unable to fetch data"
       
    }
    
    struct Images {
        static let errorImage = "exclamationmark.triangle.fill"
    }
    
    static let ProductListTitle = "Product List"
    static let loading = "Loading..."

}
