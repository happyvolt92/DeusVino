//
//  WineModel.swift
//  DeusVino
//
//  Created by Elodie Gage on 09/12/2023.
//
import UIKit
import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wine = try? JSONDecoder().decode(Wine.self, from: jsonData)

import Foundation

// MARK: - WineElement
struct WineElement: Codable {
    let id: UUID?
    let seoName, year, name: String?
    let statistics: Statistics?
    let organicCertificationID: JSONNull?
    let description: String?
    let image: WineImage?
    let wine: WineClass?
    let wineCriticReviews: [WineCriticReview]?
    let awards: [JSONAny]?
    let ranking: Ranking?
    let wineFacts: WineFacts?
    let certifiedBiodynamic, winemaker, wineMaker: JSONNull?
    let grapeComposition: [String: Int]?
    let createdAt, updatedAt: Date?
    let expertReviews: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case id
        case seoName = "seo_name"
        case year, name, statistics
        case organicCertificationID = "organic_certification_id"
        case description, image, wine
        case wineCriticReviews = "wine_critic_reviews"
        case awards, ranking
        case wineFacts = "wine_facts"
        case certifiedBiodynamic = "certified_biodynamic"
        case winemaker
        case wineMaker = "wine_maker"
        case grapeComposition = "grape_composition"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case expertReviews = "expert_reviews"
    }
}

// MARK: - WineImage
struct WineImage: Codable {
    let location: String?
    let variations: PurpleVariations?
}

// MARK: - PurpleVariations
struct PurpleVariations: Codable {
    let bottleLarge, bottleMedium, bottleMediumSquare, bottleSmall: String?
    let bottleSmallSquare, label, labelLarge, labelMedium: String?
    let labelMediumSquare, labelSmallSquare, large, medium: String?
    let mediumSquare, smallSquare: String?

    enum CodingKeys: String, CodingKey {
        case bottleLarge = "bottle_large"
        case bottleMedium = "bottle_medium"
        case bottleMediumSquare = "bottle_medium_square"
        case bottleSmall = "bottle_small"
        case bottleSmallSquare = "bottle_small_square"
        case label
        case labelLarge = "label_large"
        case labelMedium = "label_medium"
        case labelMediumSquare = "label_medium_square"
        case labelSmallSquare = "label_small_square"
        case large, medium
        case mediumSquare = "medium_square"
        case smallSquare = "small_square"
    }
}

// MARK: - Ranking
struct Ranking: Codable {
    let country, region, winery, global: CountryClass?
}

// MARK: - CountryClass
struct CountryClass: Codable {
    let description: String?
    let total, rank: Int?
}

// MARK: - Statistics
struct Statistics: Codable {
    let status: Status?
    let ratingsCount: Int?
    let ratingsAverage: Double?
    let labelsCount, wineRatingsCount, wineRatingsAverage: Int?
    let wineStatus: String?
    let winesCount: Int?

    enum CodingKeys: String, CodingKey {
        case status
        case ratingsCount = "ratings_count"
        case ratingsAverage = "ratings_average"
        case labelsCount = "labels_count"
        case wineRatingsCount = "wine_ratings_count"
        case wineRatingsAverage = "wine_ratings_average"
        case wineStatus = "wine_status"
        case winesCount = "wines_count"
    }
}

enum Status: String, Codable {
    case belowThreshold = "BelowThreshold"
    case empty = ""
    case normal = "Normal"
}

// MARK: - WineClass
struct WineClass: Codable {
    let id: UUID?
    let name, seoName: String?
    let typeID, vintageType: Int?
    let isNatural: Bool?
    let region: Region?
    let reviewStatus: Int?
    let vintageMaskRaw: JSONNull?
    let statistics: Statistics?
    let winery: Winery?
    let description: String?
    let styleID: Int?
    let grapes: [Int]?
    let foods: [Int]?
    let nonVintage: Bool?
    let alcohol: Double?
    let sweetnessID: JSONNull?
    let hidden: Bool?
    let updatedAt, createdAt: Date?
    let labelsCount: JSONNull?
    let isFirstWine: Bool?
    let taste: Taste?
    let lightWinery: LightWinery?

    enum CodingKeys: String, CodingKey {
        case id, name
        case seoName = "seo_name"
        case typeID = "type_id"
        case vintageType = "vintage_type"
        case isNatural = "is_natural"
        case region
        case reviewStatus = "review_status"
        case vintageMaskRaw = "vintage_mask_raw"
        case statistics, winery, description
        case styleID = "style_id"
        case grapes, foods
        case nonVintage = "non_vintage"
        case alcohol
        case sweetnessID = "sweetness_id"
        case hidden
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case labelsCount = "labels_count"
        case isFirstWine = "is_first_wine"
        case taste
        case lightWinery = "light_winery"
    }
}

// MARK: - LightWinery
struct LightWinery: Codable {
    let name, region: String?
    let country: LightWineryCountry?
}

enum LightWineryCountry: String, Codable {
    case cl = "cl"
    case empty = ""
    case es = "es"
    case us = "us"
}

// MARK: - Region
struct Region: Codable {
    let id: UUID?
    let name: String?
    let nameEn: NameEn?
    let seoName, country: String?
    let regionClass: Class?
    let backgroundImage: BackgroundImage?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameEn = "name_en"
        case seoName = "seo_name"
        case country
        case regionClass = "class"
        case backgroundImage = "background_image"
    }
}

// MARK: - BackgroundImage
struct BackgroundImage: Codable {
    let location: String?
    let variations: BackgroundImageVariations?
}

// MARK: - BackgroundImageVariations
struct BackgroundImageVariations: Codable {
    let large, medium: String?
}

enum NameEn: String, Codable {
    case burgundy = "Burgundy"
    case empty = ""
    case port = "Port"
}

// MARK: - Class
struct Class: Codable {
    let id: UUID?
    let countryCode, abbreviation, wineClassDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
        case countryCode = "country_code"
        case abbreviation, wineClassDescription
    }
}

// MARK: - Taste
struct Taste: Codable {
    let structure: Structure?
    let flavor: [Flavor]?
}

// MARK: - Flavor
struct Flavor: Codable {
    let group: String?
    let stats: Stats?
    let primaryKeywords, secondaryKeywords: [AryKeyword]?

    enum CodingKeys: String, CodingKey {
        case group, stats
        case primaryKeywords = "primary_keywords"
        case secondaryKeywords = "secondary_keywords"
    }
}

// MARK: - AryKeyword
struct AryKeyword: Codable {
    let id: UUID?
    let name: String?
    let count: Int?
}

// MARK: - Stats
struct Stats: Codable {
    let count, score: Int?
}

// MARK: - Structure
struct Structure: Codable {
    let acidity: Double?
    let fizziness: Int?
    let intensity: Double?
    let sweetness, tannin: Double?
    let userStructureCount, calculatedStructureCount: Int?

    enum CodingKeys: String, CodingKey {
        case acidity, fizziness, intensity, sweetness, tannin
        case userStructureCount = "user_structure_count"
        case calculatedStructureCount = "calculated_structure_count"
    }
}

// MARK: - Winery
struct Winery: Codable {
    let id: UUID?
    let name, businessName, seoName: String?
    let status: Int?
    let region: Region?
    let description, specialistsNotes, phone, email: String?
    let facebook: String?
    let instagram: String?
    let isClaimed: Bool?
    let reviewStatus: ReviewStatus?
    let twitter: String?
    let website: String?
    let winemaker: String?
    let wineMaker: WineMaker?
    let address: Address?
    let location: Location?
    let statistics: Statistics?
    let image: WineryImage?
    let backgroundImage, backgroundVideo: JSONNull?
    let wineryGroup: WineryGroup?
    let firstWines: [FirstWine]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case businessName = "business_name"
        case seoName = "seo_name"
        case status, region, description
        case specialistsNotes = "specialists_notes"
        case phone, email, facebook, instagram
        case isClaimed = "is_claimed"
        case reviewStatus = "review_status"
        case twitter, website, winemaker
        case wineMaker = "wine_maker"
        case address, location, statistics, image
        case backgroundImage = "background_image"
        case backgroundVideo = "background_video"
        case wineryGroup = "winery_group"
        case firstWines = "first_wines"
    }
}

// MARK: - Address
struct Address: Codable {
    let street: String?
    let street2: JSONNull?
    let city: String?
    let zip, state: String?
    let country: AddressCountry?
}

enum AddressCountry: String, Codable {
    case empty = ""
    case fr = "fr"
}

// MARK: - FirstWine
struct FirstWine: Codable {
    let id: UUID?
    let name, seoName: String?
    let typeID, vintageType: Int?
    let isNatural: Bool?
    let styleID: JSONNull?
    let region: Region?
    let winery, taste, statistics: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name
        case seoName = "seo_name"
        case typeID = "type_id"
        case vintageType = "vintage_type"
        case isNatural = "is_natural"
        case styleID = "style_id"
        case region, winery, taste, statistics
    }
}

// MARK: - WineryImage
struct WineryImage: Codable {
    let location: String?
    let variations: FluffyVariations?
}

// MARK: - FluffyVariations
struct FluffyVariations: Codable {
    let large, medium, smallSquare: String?

    enum CodingKeys: String, CodingKey {
        case large, medium
        case smallSquare = "small_square"
    }
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double?
    let distance: JSONNull?
}

enum ReviewStatus: String, Codable {
    case completed = "Completed"
}

// MARK: - WineMaker
struct WineMaker: Codable {
    let id: UUID?
    let name: String?
}

// MARK: - WineryGroup
struct WineryGroup: Codable {
    let id: UUID?
    let name: String?
    let website: String?
}

// MARK: - WineCriticReview
struct WineCriticReview: Codable {
    let id, wineCriticID: Int?
    let score: String?
    let scoreNormalized: Int?
    let reviewedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case wineCriticID = "wine_critic_id"
        case score
        case scoreNormalized = "score_normalized"
        case reviewedAt = "reviewed_at"
    }
}

// MARK: - WineFacts
struct WineFacts: Codable {
    let alcohol: Double?
}

typealias Wine = [WineElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
