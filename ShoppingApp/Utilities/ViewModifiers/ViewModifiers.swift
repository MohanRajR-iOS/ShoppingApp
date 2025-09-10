//
//  ViewModifiers.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import Foundation
import SwiftUI

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
