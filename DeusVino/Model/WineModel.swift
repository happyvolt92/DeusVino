//
//  WineModel.swift
//  DeusVino
//
//  Created by Elodie Gage on 09/12/2023.
//

import Foundation

struct WineResponse: Codable {
    let wine: [Wine]
    let status: String
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
    
    
    enum WineType: String, CodingKey {
        case name, link, thumb, country, region, averageRating, ratings, price, type
    }
    
   
    
////    gérer le type de vin Wine.Type dnas le struct wine puis réutiliser dans le wineType
//    enum wineType{
//        case redwine
//        case whitewine
//        case rosewine
//    }
//    
    
}
