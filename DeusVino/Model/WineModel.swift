//
//  WineModel.swift
//  DeusVino
//
//  Created by Elodie Gage on 09/12/2023.
//

import Foundation

struct WineResponse: Codable {
    let vinos: [Wine]
    let status: String
    let message: String?
    let httpStatus: Int?
    let pageIndex: Int?
}

struct Wine: Codable {
    let name: String
    let link: String
    let thumb: String
    let country: String
    let region: String
    let averageRating: Double
    let ratings: Int
    let price: Double
    let type: String 

    enum CodingKeys: String, CodingKey {
        case name, link, thumb, country, region, averageRating, ratings, price, type
    }
}
