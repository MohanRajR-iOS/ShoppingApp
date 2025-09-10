//
//  View.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import Foundation
import SwiftUI

extension View {
    public func applyCustomModifier(font: Font? = .title2, fontWeight: Font.Weight? = .medium, foregroundColor: Color? = .primary) -> some View {
        modifier(CustomModifier(font: font, fontWeight: fontWeight, foregroundColor: foregroundColor))
    }
}
