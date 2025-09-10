//
//  ProductsListView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import SwiftUI

struct ProductsListView: View {

    @StateObject var productsListViewModel = ProductsListViewModel()

    var body: some View {

        NavigationStack {

            if productsListViewModel.isLoading {
                ProgressView(label: { Text(AppConstants.loading) })
            } else if let productsList = productsListViewModel.productsList, !productsList.isEmpty {
                productListView(products: productsList)
            } else {
                ErrorMessageView(message: AppConstants.Error.noProductsFound)
            }
        }.task {
            await productsListViewModel.getAllProducts()

        }
    }
    private func productListView(products: [ProductModel]) -> some View {

        List(products, id: \.id) { product in
            NavigationLink(value: product.id) {
                HStack {

                    AsyncImage(url: URL(string: product.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)

                    VStack(alignment: .leading) {

                        Text(product.title)
                            .bold()
                            .lineLimit(2)

                        Text(product.category.capitalized)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(2)

                    }
                }
            }
        }
        .navigationTitle(AppConstants.ProductListTitle)
        .navigationDestination(for: Int.self) { productID in
            ProductDetailView(productId: productID)
        }
    }
}

#Preview {
    ProductsListView()
}
