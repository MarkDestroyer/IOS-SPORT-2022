//
//  SaveUserInfoViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import UIKit
import RealmSwift
import Firebase

class SaveUserInfoViewController: UIViewController {

    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var WeightTextField: UITextField!
    @IBOutlet var ChestDiameterTextField: UITextField!
    @IBOutlet var BeltDiameterTextField: UITextField!
  
    public var completionHandlerUser: (() -> Void)?
    let ref = Database.database().reference(withPath: "userinfo/users") // ссылка на контейнер/папку в Database
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ref.observe(.value, with: { snapshot in
            
            var users: [UserFB] = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let user = UserFB(snapshot: snapshot) {
                       users.append(user)
                }
            }
      })
    }
        
    
    
    
    
    @IBAction func Save(_ sender: Any) {
        didTapSaveButton()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func didTapSaveButton() {
        if let text = NameTextField.text, !text.isEmpty {
            if let text2 = EmailTextField.text, !text.isEmpty {
                if let text3 = WeightTextField.text, !text.isEmpty {
                    if let text4 = ChestDiameterTextField.text, !text.isEmpty {
                        if let text5 = BeltDiameterTextField.text, !text.isEmpty {
                            
                            let user = UserFB(name: text, email: text2, weight: Double(text3) ?? 0, chestdiameter: Double(text4) ?? 0, beltdiameter: Double(text5) ?? 0)
                            
                            
                            let exersiseRef = self.ref.child(text)
                            
                            
                            exersiseRef.setValue(user.toAnyObject())
                            
                            completionHandlerUser?()
                            navigationController?.popToRootViewController(animated: true)
                        }
                    }
                }
            }
        }
    }
}
