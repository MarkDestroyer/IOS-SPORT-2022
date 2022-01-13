//
//  ExercisesDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import Foundation
import RealmSwift

class ExercisesDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var MuscleID: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var Description: String = ""
    @objc dynamic var movie: String = ""
}
