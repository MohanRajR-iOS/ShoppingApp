//
//  ErrorMessageView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 05/09/25.
//

import SwiftUI

struct ErrorMessageView: View {
    
    var message: String
    
    var body: some View {
        
        VStack {
            Image(systemName: AppCommon.Images.errorImage)
                            .font(.largeTitle)
                            .foregroundColor(.red)
            Text(message)
                .font(.title)
        }
    }
}

#Preview {
    ErrorMessageView(message: AppCommon.Error.noProductsFound)
}
