//
//  UserModel.swift
//  Sport 2022
//
//  Created by Марк Киричко on 29.12.2021.
//
import UIKit
import RealmSwift

class UserProfile: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
}
