//
//  UserDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import Foundation
import RealmSwift

class UserDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var dateborn: String = ""
    @objc dynamic var height: Double = 0
    @objc dynamic var weight: Double = 0
    @objc dynamic var email: String = ""
    @objc dynamic var ChestDiameter: Double = 0
    @objc dynamic var BeltDiameter: Double = 0
}

