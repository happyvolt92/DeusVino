//
//  WineModel.swift
//  DeusVino
//
//  Created by Elodie Gage on 09/12/2023.
//

import Foundation

// MARK: - Models

enum WineType: String {
    case red
    case white
    case rose
}

struct WineRating: Codable {
    let average: String
    let reviews: String
}

struct Wine: Codable {
    let winery: String
    let wine: String
    let rating: WineRating
    let location: String
    let image: String
    let id: Int
    
    var type: WineType {
        if wine.lowercased().contains("red") {
            return .red
        } else if wine.lowercased().contains("white") {
            return .white
        } else if wine.lowercased().contains("rose") {
            return .rose
        } else {
            return .red
        }
    }
}

struct WineList: Codable {
    let wines: [Wine]
}
