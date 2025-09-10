//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import SwiftUI

struct ProductDetailView: View {

    var productId: Int

    @StateObject var productDetailViewModel = ProductDetailViewModel()

    var body: some View {

        Group {

            if productDetailViewModel.isLoading {
                ProgressView(label: { Text(AppConstants.loading) })
            } else if let productDetail = productDetailViewModel.productDetail {

                ScrollView {
                    VStack(spacing: 20) {

                        ProductHeaderView(image: productDetail.image)

                        ProductContentView(productDetail: productDetail)

                        ProductBottomView(price: productDetail.price)
                    }
                    .padding()
                    .navigationTitle(AppConstants.ProductDetailTitle)
                    .navigationBarTitleDisplayMode(.inline)
                }

            } else {
                ErrorMessageView(message: AppConstants.Error.unableToFetchData
                )
            }
        }.task {
            await productDetailViewModel.getProductDetails(productId: productId)
        }
    }
}

#Preview {
    ProductDetailView(productId: 1)
}
