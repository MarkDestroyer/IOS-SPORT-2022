//
//  customModel.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.
//

import Foundation
// MARK: - AtedBy
struct AtedBy: Codable {
    let username: JSONNull?
    let id: Int
    let lastname, firstname: String
}

// MARK: - Role
struct Role: Codable {
    let updatedBy: JSONNull?
    let id: Int
    let createdBy: JSONNull?
    let name, roleDescription, type: String

    enum CodingKeys: String, CodingKey {
        case updatedBy = "updated_by"
        case id
        case createdBy = "created_by"
        case name
        case roleDescription = "description"
        case type
    }
}

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
