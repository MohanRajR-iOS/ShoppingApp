//
//  ProductContentView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import SwiftUI

struct ProductContentView: View {

    let productDetail: ProductDetailModel

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(productDetail.category.capitalized)
                    .applyCustomModifier(font: .subheadline, fontWeight: .medium, foregroundColor: .gray)
                Spacer()
                Image(systemName: AppConstants.Images.ratingImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)

                Text("\(productDetail.rating.rate, specifier: "%.1f")(\(productDetail.rating.count))")
                    .applyCustomModifier(font: .subheadline, fontWeight: .medium, foregroundColor: .gray)
            }
            .padding(.bottom, 5)

            Text(productDetail.title)
                .applyCustomModifier(font: .title2, fontWeight: .medium, foregroundColor: .primary)
                .padding(.bottom, 5)

            Text(productDetail.summary)
                .applyCustomModifier(font: .subheadline, fontWeight: .regular, foregroundColor: .gray)

        }

    }
}

#Preview {
    let productDetail = ProductDetailModel(id: 1,
                                           title: "Sample Product",
                                           price: 0.0,
                                           summary: "",
                                           category: "Sample Category",
                                           image: "",
                                           rating: RatingModel(rate: 0.0, count: 0))
    ProductContentView(productDetail: productDetail)
}
