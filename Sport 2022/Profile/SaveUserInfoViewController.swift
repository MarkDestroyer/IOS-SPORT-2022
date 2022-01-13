//
//  SaveUserInfoViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 13.01.2022.
//

import UIKit
import RealmSwift

class SaveUserInfoViewController: UIViewController {

    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var EmailTextField: UITextField!
    @IBOutlet var WeightTextField: UITextField!
    @IBOutlet var ChestDiameterTextField: UITextField!
    @IBOutlet var BeltDiameterTextField: UITextField!
    
    
    let realm = try! Realm()
    public var completionHandlerUser: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Save(_ sender: Any) {
        didTapSaveButton()
    }
    
    
    @objc func didTapSaveButton() {
        if let text = NameTextField.text, !text.isEmpty {
            if let text2 = EmailTextField.text, !text.isEmpty {
                if let text3 = WeightTextField.text, !text.isEmpty {
                    if let text4 = ChestDiameterTextField.text, !text.isEmpty {
                        if let text5 = BeltDiameterTextField.text, !text.isEmpty {
                            realm.beginWrite()
                            let newItem = UserDB()
                            newItem.name = text
                            newItem.email = text2
                            newItem.weight =  Double(text3) ?? 0
                            newItem.ChestDiameter = Double(text4) ?? 0
                            newItem.BeltDiameter = Double(text5) ?? 0
                            realm.add(newItem)
                            try! realm.commitWrite()

                            completionHandlerUser?()
                            navigationController?.popToRootViewController(animated: true)
                            print(realm.configuration.fileURL)
                        }
                    }
                }
            }
        }
    }
}
