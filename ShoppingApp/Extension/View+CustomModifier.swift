//
//  View+CustomModifier.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import Foundation
import SwiftUI

extension View {
    public func applyCustomModifier(font: Font, fontWeight: Font.Weight, foregroundColor: Color) -> some View {
        modifier(CustomModifier(font: font, fontWeight: fontWeight, foregroundColor: foregroundColor))
    }
}
