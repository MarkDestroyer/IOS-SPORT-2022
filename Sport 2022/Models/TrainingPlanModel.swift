//
//  TrainingPlanModel.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation
import RealmSwift


// MARK: - TrainingPlanElement
class TrainingPlanElement:Object, Codable {
    @objc dynamic var id, replay: Int
    @objc dynamic var trainingPlanDescription: String?
    @objc dynamic var exercise: ExercisePlan?
    @objc dynamic var createdAt: String
    @objc dynamic var createdBy: AtedByPlan?
    @objc dynamic var weight: Double
    @objc dynamic var date, updatedAt: String
    @objc dynamic var updatedBy: AtedByPlan?
    @objc dynamic var user: User?
    @objc dynamic var analize: String?
    @objc dynamic var counter: Int

    enum CodingKeys: String, CodingKey {
        case id, replay
        case trainingPlanDescription = "description"
        case exercise
        case createdAt = "created_at"
        case createdBy = "created_by"
        case weight, date
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
        case user, analize, counter
    }
}

// MARK: - AtedBy
class AtedByPlan: Object, Codable {
    @objc dynamic var username: String?
    @objc dynamic var id: Int
    @objc dynamic var lastname: String?
    @objc dynamic var firstname: String?
}

// MARK: - Exercise
class ExercisePlan: Object, Codable {
    @objc dynamic var movie: String?
    @objc dynamic var id, createdBy: Int
    @objc dynamic var name: String
    @objc dynamic var exerciseDescription: String?
    @objc dynamic var updatedBy: Int

    enum CodingKeys: String, CodingKey {
        case movie, id
        case createdBy = "created_by"
        case name
        case exerciseDescription = "description"
        case updatedBy = "updated_by"
    }
}

// MARK: - User
class User: Object,Codable {
    @objc dynamic var id: Int
    @objc dynamic var provider: String
    @objc dynamic var blocked: Bool
    @objc dynamic var createdAt, surname: String
    @objc dynamic var createdBy: Int
    @objc dynamic var confirmed: Bool
    @objc dynamic var birthday, updatedAt, username: String
    @objc dynamic var role, updatedBy: Int
    @objc dynamic var email, name: String

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

typealias TrainingPlan = [TrainingPlanElement]
