//
//  ProfileViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 29.12.2021.
//

import UIKit
import Firebase
import RealmSwift

class ProfileViewController: UIViewController {

    
    let authService = Auth.auth()
    
    var user: Array<UserProfile> = [UserProfile]()
    let personDB = PersonDB()
    
    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(UserProfile.self)
            
            self.user = Array(userinfo)
            
            for person in user {
                var firstname = person.name
                var lastname = person.surname
                name.text = firstname
                surname.text = lastname
            }
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func showLoginVC() {
        guard let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") else {return}
        guard let window = self.view.window else {return}
        window.rootViewController = vc
    }
    
    
    
    @IBAction func SignOutAction(_ sender: Any) {
        
        try?authService.signOut()
        showLoginVC()
    }


}
