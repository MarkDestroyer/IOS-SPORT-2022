//
//  UserProfile.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation

// MARK: - UserProfile
struct UserProfile: Codable {
    let jwt: String
    let user: UserP
}

// MARK: - User
struct UserP: Codable {
    let id: Int
    let provider: String
    let blocked: Bool
    let createdAt, surname: String
    let createdBy: AtedBy
    let confirmed: Bool
    let birthday, updatedAt, username: String
    let role: Role
    let updatedBy: AtedBy
    let email, name: String

    enum CodingKeys: String, CodingKey {
        case id, provider, blocked
        case createdAt = "created_at"
        case surname
        case createdBy = "created_by"
        case confirmed, birthday
        case updatedAt = "updated_at"
        case username, role
        case updatedBy = "updated_by"
        case email, name
    }
}



