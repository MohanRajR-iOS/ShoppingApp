//
//  ProductHeaderView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import SwiftUI

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

#Preview {
    ProductHeaderView(image: "")
}

