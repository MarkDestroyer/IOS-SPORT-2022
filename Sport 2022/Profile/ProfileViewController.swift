//
//  ProfileViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import UIKit
import RealmSwift
import Firebase

class ProfileViewController: UIViewController {

    
    @IBOutlet var ProfileImage: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var EmailLabel: UILabel!
    @IBOutlet var WeightLabel: UILabel!
    @IBOutlet var ChestDiameterLabel: UILabel!
    @IBOutlet var BeltDiameterLabel: UILabel!
    
    let authService = Auth.auth()
    var user: Array<UserDB> = [UserDB]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    @IBAction func loadPhoto() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
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
                    WeightLabel.text = ("Вес \(String(weight)) кг")
                    ChestDiameterLabel.text = ("Диаметр груди \(String(chestdiameter)) мм")
                    BeltDiameterLabel.text = ("Диаметр пояса \(String(beltdiameter)) мм")
                }
            } catch {
                // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            ProfileImage.image = image
        }
        
        ProfileImage.layer.borderWidth = 2
        ProfileImage.layer.masksToBounds = false
        ProfileImage.layer.borderColor = UIColor.black.cgColor
        ProfileImage.layer.cornerRadius = ProfileImage.frame.height/2
        ProfileImage.clipsToBounds = true
        
        print("\(info)")
    
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
