//
//  ExerciseViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Strapi_iOS
import UIKit

class ExerciseViewController: UIViewController {
    
    let exerciseAPI = ExerciseAPI()
    let exerciseDB  = ExerciseDB()
    var exercise: [ExerciseProfiles] = []
    var exerciseLocalDB: [ExerciseProfiles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseAPI.getExercise{[weak self]  users in
        self?.exercise = users!
        }
    }
  
    @IBAction func writeDataToDB(_ sender: Any) {
        print("Пробуем записать в базу")
        exerciseDB.addData(exercise)
    }
    
    @IBAction func readDataFromDB(_ sender: Any) {
        exerciseLocalDB = exerciseDB.fetch()
        print(exerciseLocalDB)
    }
    
    @IBAction func deletaAllDB(_ sender: Any) {
        exerciseDB.delete()
    }
    
}

