//
//  PlanDayDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 05.02.2022.
//


import Foundation
import RealmSwift

class PlanDayDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var PlanDayLocal: [TrainingPlanElement] = []
    
    

     func addData(_ planDayLocal: [TrainingPlanElement]) {
        
         PlanDayLocal = planDayLocal
        let planDay = TrainingPlanElement()
        let count = self.PlanDayLocal.count
        var i = 0
         print(count)
        mainRealm.beginWrite()
         while i < count {
             planDay.id = self.PlanDayLocal[i].id
             planDay.exercise = self.PlanDayLocal[i].exercise
             planDay.replay = self.PlanDayLocal[i].replay
             planDay.counter = self.PlanDayLocal[i].counter
             planDay.weight = self.PlanDayLocal[i].weight
             planDay.trainingPlanDescription = self.PlanDayLocal[i].trainingPlanDescription
            
             mainRealm.add(planDayLocal)

             i = i + 1
          }
         
        do {
            try mainRealm.commitWrite()
            print(mainRealm.configuration.fileURL as Any)
        } catch {
            print(error.localizedDescription)
        }
     }
    func fetch() -> [TrainingPlanElement] {
             //Прочитать объекты
             print(mainRealm.configuration.fileURL as Any)
             let users = mainRealm.objects(TrainingPlanElement.self)
             return Array(users)
         }
    func delete () {
        try! mainRealm.write{
            mainRealm.deleteAll()
        }
    }
 }



