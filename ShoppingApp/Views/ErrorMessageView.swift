//
//  ErrorMessageView.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
//

import SwiftUI

struct ErrorMessageView: View {
    var message: String
    var body: some View {
        VStack {
            Image(systemName: AppConstants.Images.errorImage)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(message)
                .font(.title)
        }
    }
}

#Preview {
    ErrorMessageView(message: AppConstants.Error.noProductsFound)
}
