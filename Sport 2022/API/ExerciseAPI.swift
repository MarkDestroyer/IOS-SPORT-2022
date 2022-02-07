//
//  ExerciseAPI.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Strapi_iOS
import Foundation

final class ExerciseAPI{
    
    var token = Session.shared.token
    var data: Data?
    var exercise: [ExerciseProfiles] = []
    
    func getExercise(comletion: @escaping(([ExerciseProfiles]?)->())){
        let strapi = Strapi.shared
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
    
    let request = Request(
        method: "GET",
        contentType: "exercises" // You can use any route here
    )
    strapi.exec(request: request, needAuthentication: true) { response in
        guard let data = response.data else {return}
        self.data = data as? Data
        do{
          //  print(self.data?.prettyJSON)
            print("Парсим JSON упражнений")
            
            let exerciseJSON = try JSONDecoder().decode([ExerciseProfiles].self, from: self.data!)
            comletion(exerciseJSON)
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
        }
    }
    
   }
}

