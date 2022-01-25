//
//  ExercisesFB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 18.01.2022.
//

import Foundation
import Firebase

class ExercisesFB {
    // 1
    let name: String
    let ref: DatabaseReference?
    let approach: Int
    let replay: Int
    let weight: Double
    let comment: String
    
    init(name: String, approach: Int, replay: Int, weight: Double, comment: String) {
        // 2
        self.ref = nil
        self.name = name
        self.approach = approach
        self.replay = replay
        self.weight = weight
        self.comment = comment
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String,
            let approach = value["approach"] as? Int,
            let replay = value["replay"] as? Int,
            let weight = value["weight"] as? Double,
            let comment = value["comment"] as? String
        else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.approach = approach
        self.replay = replay
        self.weight = weight
        self.comment = comment
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            
            "approach": approach,
            "weight": weight,
            "replay": replay,
            "comment": comment
        ]
    }
}



