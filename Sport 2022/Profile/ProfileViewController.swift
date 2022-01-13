//
//  ProfileViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

    
    @IBOutlet var ProfileImage: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var EmailLabel: UILabel!
    @IBOutlet var WeightLabel: UILabel!
    @IBOutlet var ChestDiameterLabel: UILabel!
    @IBOutlet var BeltDiameterLabel: UILabel!
    
    
    var user: Array<UserDB> = [UserDB]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func loadData() {
            do {
                let realm = try Realm()

                let userinfo = realm.objects(UserDB.self)

                self.user = Array(userinfo)

                for person in user {
                    let firstname = person.name
                    let email = person.email
                    let weight = person.weight
                    let chestdiameter = person.ChestDiameter
                    let beltdiameter = person.BeltDiameter
                    NameLabel.text = firstname
                    EmailLabel.text = email
                    WeightLabel.text = ("Вес\(String(weight))")
                    ChestDiameterLabel.text = ("Диаметр груди \(String(chestdiameter))")
                    BeltDiameterLabel.text = ("Диаметр пояса\(String(beltdiameter))")
                }
            } catch {
                // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}
