//
//  ResponseCreate.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation

// MARK: - ResponceCreate
struct ResponceCreate: Codable {
    let id, replay: Int
    let responceCreateDescription: String
    let exercise: Exercise
    let createdAt: String
    let createdBy: JSONNull?
    let weight: Int
    let date, updatedAt: String
    let updatedBy: JSONNull?
    let user: UserResponce
    let analize: String
    let counter: Int

    enum CodingKeys: String, CodingKey {
        case id, replay
        case responceCreateDescription = "description"
        case exercise
        case createdAt = "created_at"
        case createdBy = "created_by"
        case weight, date
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
        case user, analize, counter
    }
}

// MARK: - Exercise
struct Exercise: Codable {
    let movie: JSONNull?
    let id, createdBy: Int
    let name: String
    let exerciseDescription: JSONNull?
    let updatedBy: Int

    enum CodingKeys: String, CodingKey {
        case movie, id
        case createdBy = "created_by"
        case name
        case exerciseDescription = "description"
        case updatedBy = "updated_by"
    }
}

// MARK: - User
struct UserResponce: Codable {
    let id: Int
    let provider: String
    let blocked: Bool
    let createdAt, surname: String
    let createdBy: Int
    let confirmed: Bool
    let birthday, updatedAt, username: String
    let role, updatedBy: Int
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
