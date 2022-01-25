//
//  UserFB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 18.01.2022.
//

import Foundation
import Firebase

class UserFB {
    // 1
    let name: String
    let ref: DatabaseReference?
    let email: String
    let weight: Double
    let chestdiameter: Double
    let beltdiameter: Double
    
    init(name: String, email: String, weight: Double, chestdiameter: Double, beltdiameter: Double) {
        // 2
        self.ref = nil
        self.email = email
        self.weight = weight
        self.chestdiameter = chestdiameter
        self.beltdiameter = beltdiameter
        self.name = name
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String,
            let email = value["email"] as? String,
            let weight = value["weight"] as? Double,
            let chestdiameter = value["chestdiameter"] as? Double,
            let beltdiameter = value["beltdiameter"] as? Double
        else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.email = email
        self.weight = weight
        self.chestdiameter = chestdiameter
        self.beltdiameter = beltdiameter
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            "email": email,
            "weight": weight,
            "chestdiameter": chestdiameter,
            "beltdiameter": beltdiameter
        ]
    }
}




