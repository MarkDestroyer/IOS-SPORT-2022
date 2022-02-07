// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let exercises = try? newJSONDecoder().decode(Exercises.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Exercise
//Модель данных используемая для созранения списка упражнений с сервера
class ExerciseProfiles: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var exerciseDescription: String?
    @objc dynamic var createdBy, updatedBy: AtedByE?
    @objc dynamic var createdAt, updatedAt: String?
    @objc dynamic var movie: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case exerciseDescription = "description"
        case createdBy = "created_by"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case movie
    }
}
class AtedByE: Object, Codable {
    @objc dynamic var  username: String?
    @objc dynamic var  id: Int
    @objc dynamic var  lastname, firstname: String
}
