//
//  CreateExerciseAPI.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation
import Strapi_iOS


final class CreateExerciseAPI{
    var data: Data?
    var token = Session.shared.token
    func createPlan(date: String, exercise: [String:Int], replay: Int, counter: Int, weight: Double, description: String){
        let strapi = Strapi.shared
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
    
        let request = CreateRequest(
            contentType: "plan",
            parameters: [
                "date": date,
                "exercise": exercise,
                "replay": replay,
                "counter": counter,
                "weight": weight,
                "description": description,
                "analize": "fact",
            ]
        )
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data as? Data else {return}
            do{
                let respopnceJSON = try JSONDecoder().decode(ResponceCreate.self, from: data)
                print(respopnceJSON)
                
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
