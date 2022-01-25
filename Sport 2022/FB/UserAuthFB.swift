//
//  UserAuthFB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 19.01.2022.
//

import Foundation
import Firebase

class UserAuthFB {
    // 1

    let ref: DatabaseReference?
    let email: String
    let password: Int
    
    init(email: String, password: Int) {
        // 2
        self.ref = nil
        self.email = email
        self.password = password
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let email = value["email"] as? String,
            let password = value["password"] as? Int
        else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.email = email
        self.password = password
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "email": email,
            "password": password
        ]
    }
}





