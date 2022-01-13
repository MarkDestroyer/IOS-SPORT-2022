//
//  UserPlanDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import Foundation
import RealmSwift

class UserPlanDB: Object  {
    @objc dynamic var id: Int = 0
    @objc dynamic var UserID: Int = 0
    @objc dynamic var PlanID: Int = 0
    @objc dynamic var comment: String = ""
}
