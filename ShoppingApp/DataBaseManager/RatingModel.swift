//
//  RatingModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 10/09/25.
//

import Foundation
import SwiftData

// MARK: - RatingModel
@Model final class RatingModel {

    var rate: Double
    var count: Int

    init(rate: Double, count: Int) {
        self.rate = rate
        self.count = count
    }
}
