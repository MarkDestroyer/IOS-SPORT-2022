//
//  PlanDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import Foundation
import RealmSwift

class PlanDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var date: Date = Date()
    @objc dynamic var ExercisesID: Int = 0
    @objc dynamic var counter: Int = 0
    @objc dynamic var replay: Int = 0
    @objc dynamic var weight: Double = 0
    @objc dynamic var comment: String = ""
}
