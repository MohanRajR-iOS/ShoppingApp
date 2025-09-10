//
//  ProductBottomView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import SwiftUI

struct ProductBottomView: View {

    let price: Double
    @State private var showAlert = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {

                Text(AppConstants.ProductTotalPrice)
                    .applyCustomModifier(font: .title3, fontWeight: .medium, foregroundColor: .gray)

                Text("$\(String(price))")
                    .applyCustomModifier(font: .title2, fontWeight: .medium, foregroundColor: .primary)
            }
            Spacer()
            Button(action: {
                showAlert = true
            }, label: {
                HStack(spacing: 12) {
                    Image(systemName: AppConstants.Images.cartImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)

                    Text(AppConstants.ProductAddCart)
                        .applyCustomModifier(font: .title2, fontWeight: .medium, foregroundColor: .white)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
                .background(.blue)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
                .alert(AppConstants.ProductAddCart, isPresented: $showAlert) {

                } message: {
                    Text(AppConstants.cartSuccessMessage)
                }
            })
        }
    }
}

#Preview {
    ProductBottomView(price: 0.0)
}
