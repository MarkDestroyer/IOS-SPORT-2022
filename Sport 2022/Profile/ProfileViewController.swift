//
//  ProfileViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    
    @IBOutlet var ProfileImage: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var EmailLabel: UILabel!
    @IBOutlet var WeightLabel: UILabel!
    @IBOutlet var ChestDiameterLabel: UILabel!
    @IBOutlet var BeltDiameterLabel: UILabel!
    
    let authService = Auth.auth()
    private var users = [UserAuthFB]()
    let ref = Database.database().reference(withPath: "userinfo/users") // ссылка на контейнер/папку в Database
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
           ref.observe(.value, with: { snapshot in
               
               var users: [UserAuthFB] = []
               var settings: [UserFB] = []
               // 2
               for child in snapshot.children {
                   if let snapshot = child as? DataSnapshot,
                      let user = UserAuthFB(snapshot: snapshot) {
                          users.append(user)
                       self.EmailLabel.text = user.email
                       
                   }
                
               }
               
               for child in snapshot.children {
                   if let snapshot = child as? DataSnapshot,
                      let setting = UserFB(snapshot: snapshot) {
                          settings.append(setting)
                       self.NameLabel.text = setting.name
                       self.EmailLabel.text = setting.email
                       self.WeightLabel.text = ("Вес: \(String(setting.weight)) кг")
                       self.ChestDiameterLabel.text = ("Диаметр груди: \(String(setting.chestdiameter)) мм")
                       self.BeltDiameterLabel.text = ("Диаметр пояса: \(String(setting.chestdiameter)) мм")
                
                   }
                
               }

           })
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
