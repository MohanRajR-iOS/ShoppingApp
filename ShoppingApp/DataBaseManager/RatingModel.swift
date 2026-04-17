//
//  RatingModel.swift
//  ShoppingApp
//
//  Created by Mohan raj on 17/04/26.
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

extension RatingModel {
    func ratingModelToRating() -> Rating {
        Rating(
            rate: rate,
            count: count
        )
    }
}

