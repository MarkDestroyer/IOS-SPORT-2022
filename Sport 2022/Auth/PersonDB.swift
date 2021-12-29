//
//  PersonDB.swift
//  Sport 2022
//
//  Created by Марк Киричко on 29.12.2021.
//

import Foundation
import RealmSwift

protocol PersonDBProtocol {
    
    func add(_ user: UserProfile)
    func read() -> [UserProfile]
    func delete(_ user: UserProfile)
}

class PersonDB: PersonDBProtocol {
    
    let config = Realm.Configuration(schemaVersion: 5)
    lazy var mainRealm = try! Realm(configuration: config)
    
    var user: Array<UserProfile> = [UserProfile]()
    
    func add(_ user: UserProfile) {
        
        //DispatchQueue.main.async {
            do {
                self.mainRealm.beginWrite()
                self.mainRealm.add(user)
                try self.mainRealm.commitWrite()
                
            } catch {
                print(error.localizedDescription)
            }
        //}
        
    }
    
    func read() -> [UserProfile] {
        
            let users = mainRealm.objects(UserProfile.self)
            
            users.forEach { print($0.name, $0.surname) }
        
            print(mainRealm.configuration.fileURL)
            
            return Array(users)
        
    }
    
    func delete(_ user: UserProfile) {
        //DispatchQueue.main.async {
            do {
                self.mainRealm.beginWrite()
                self.mainRealm.delete(user)
                try self.mainRealm.commitWrite()
            } catch {
                print(error.localizedDescription)
            }
        //}
        
    }
    
    
        func saveUserData(_ info: (UserProfile)) {
            do {
                let realm = try Realm()
                let oldUserInfo = realm.objects(UserProfile.self)
                
                realm.beginWrite()
    
                realm.delete(oldUserInfo)
                
                realm.add(info)
                
                try realm.commitWrite()
            } catch {
    
                print(error)
            }
        }
    
    func loadData() {
            do {
                let realm = try Realm()
                
                let userinfo = realm.objects(UserProfile.self)
                
                self.user = Array(userinfo)
                
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }


}



