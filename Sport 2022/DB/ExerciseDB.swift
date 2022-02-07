//
//  ExerciseDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 05.02.2022.
//

import Foundation
import RealmSwift

class ExerciseDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var ExerciseLocal: [ExerciseProfiles] = []
    
    

     func addData(_ exerciseLocal: [ExerciseProfiles]) {
        
        ExerciseLocal = exerciseLocal
        let exercise = ExerciseProfiles()
        let e = self.ExerciseLocal.count
        var i = 0
        mainRealm.beginWrite()
         while i < e {
             exercise.id = self.ExerciseLocal[i].id
             exercise.name = self.ExerciseLocal[i].name
             exercise.exerciseDescription = self.ExerciseLocal[i].exerciseDescription
             exercise.movie = self.ExerciseLocal[i].movie

             mainRealm.add(exerciseLocal)

             i = i + 1
          }
         
        do {
            try mainRealm.commitWrite()
            print(mainRealm.configuration.fileURL as Any)
        } catch {
            print(error.localizedDescription)
        }
     }
    func fetch() -> [ExerciseProfiles] {
             //Прочитать объекты
             let users = mainRealm.objects(ExerciseProfiles.self)
             return Array(users)
         }
    func delete () {
        try! mainRealm.write{
            mainRealm.deleteAll()
        }
    }
 }



