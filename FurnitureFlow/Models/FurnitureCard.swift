//
//  FurnitureCard.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 23/11/25.
//

import Foundation

struct FurnitureCard: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var subTitle: String
    var price: Int
    let rating: Double
    var isLiked: Bool = false
    var description: String 
}
