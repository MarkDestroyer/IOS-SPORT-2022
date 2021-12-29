//
//  HomeViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 29.12.2021.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    var bd = PersonDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bd.read()
        // Do any additional setup after loading the view.
    }
    

    var UserRealm = try! Realm()
    public var completionHandlerUser: (() -> Void)?

    
    @IBOutlet var name: UITextField!
    @IBOutlet var surname: UITextField!
    
    
    
    @IBAction func SaveUserInfo(_ sender: Any) {
        didTapSaveButtonUser()
    }
    
    @objc func didTapSaveButtonUser() {
        if let text = name.text , !text.isEmpty {
            if let text2 = surname.text, !text2.isEmpty {
                UserRealm.beginWrite()
                let newItem = UserProfile()
                newItem.name = text
                newItem.surname = text2
                UserRealm.add(newItem)
                try! UserRealm.commitWrite()
            }
        }
    }
}
