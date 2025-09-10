//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    var productId: Int
    
    @State var productDetailViewModel = ProductDetailViewModel()
    
    var body: some View {
        
        Group {
            
            if productDetailViewModel.isLoading {
                ProgressView(label: { Text(AppCommon.loading) })
            }else if let productDetail = productDetailViewModel.productDetail {
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        ProductHeaderView(image: productDetail.image)
                        
                        ProductContentView(productDetail: productDetail)
                        
                        ProductBottomView(price: productDetail.price)
                    }
                    .padding()
                    .navigationTitle(AppCommon.ProductDetailTitle)
                    .navigationBarTitleDisplayMode(.inline)
                }
                
            }else {
                ErrorMessageView(message: AppCommon.Error.unableToFetchData)
            }
        }.onAppear{
            Task {
                await productDetailViewModel.getProductDetails(productId: productId)
            }
        }
    }
}

#Preview {
    ProductDetailView(productId: 1)
}

struct ProductHeaderView: View {
    
    let image: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.thinMaterial)
                .frame(height: 250)
            
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
        }
        
    }
    
}

struct ProductContentView: View {
    
    let productDetail: ProductDetailObject
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(productDetail.category.capitalized)
                    .applyCustomModifier(font: .subheadline, foregroundColor: .gray)
                Spacer()
                Image(systemName: AppCommon.Images.ratingImage)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
                
                Text("\(productDetail.rating.rate, specifier: "%.1f")(\(productDetail.rating.count))")
                    .applyCustomModifier(font: .subheadline, foregroundColor: .gray)
            }
            .padding(.bottom, 5)
            
            Text(productDetail.title)
                .applyCustomModifier(font: .title2, fontWeight: .medium)
                .padding(.bottom, 5)
            
            Text(productDetail.summary)
                .applyCustomModifier(font: .subheadline, fontWeight: .regular, foregroundColor: .gray)
            
        }
        
    }
}


struct ProductBottomView: View {
    
    let price: Double
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(AppCommon.ProductTotalPrice)
                    .applyCustomModifier(font: .title3, foregroundColor: .gray)
                
                Text("$\(String(price))")
                    .applyCustomModifier(font: .title2, fontWeight: .medium)
            }
            Spacer()
            Button(action: {
                print("Add to cart clicked")
                showAlert = true
            }, label: {
                HStack(spacing: 12) {
                    Image(systemName: AppCommon.Images.cartImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                    
                    Text(AppCommon.ProductAddCart)
                        .applyCustomModifier(font: .title2, fontWeight: .medium, foregroundColor: .white)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
                .background(.blue)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
                .alert(AppCommon.ProductAddCart, isPresented: $showAlert) {

                } message: {
                    Text(AppCommon.cartSuccessMessage)
                }
            })
        }
    }
}


struct CustomModifier: ViewModifier {
    
    var font: Font?
    var fontWeight: Font.Weight?
    var foregroundColor: Color?
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(foregroundColor)
            
    }
}

extension View {
    public func applyCustomModifier(font: Font? = .title2, fontWeight: Font.Weight? = .medium, foregroundColor: Color? = .primary) -> some View {
        modifier(CustomModifier(font: font, fontWeight: fontWeight, foregroundColor: foregroundColor))
    }
}
