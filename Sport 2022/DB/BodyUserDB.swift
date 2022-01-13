//
//  BodyUserBD.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import Foundation
import RealmSwift

class BodyUserDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var UserID: Int = 0
    @objc dynamic var BodyParameterID: Int = 0
    @objc dynamic var DataParameter: Int = 0
    @objc dynamic var date: Date = Date()
    @objc dynamic var comment: String = ""
}
