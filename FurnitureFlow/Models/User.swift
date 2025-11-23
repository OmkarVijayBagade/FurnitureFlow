//
//  UserData.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 23/11/25.
//

import Foundation

struct User: Codable {
    var id = UUID()
    let name: String
    let email: String
    let phone: String
    let address: String
    let city: String
    let country: String
}
