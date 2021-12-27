//
//  EntryViewController2.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift

class EntryViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet var TextFieldTuesday: UITextField!
    @IBOutlet var TextFieldTuesday2: UITextField!
    @IBOutlet var TextFieldTuesday3: UITextField!
    @IBOutlet var TextFieldTuesday4: UITextField!
    @IBOutlet var TextFieldTuesday5: UITextField!
    @IBOutlet var TextFieldTuesday6: UITextField!
    
    
    @IBAction func save2(_ sender: Any) {
        didTapSaveButton2()
    }
    
    
    
    private let realm2 = try! Realm()
    public var completionHandler2: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldTuesday.becomeFirstResponder()
        TextFieldTuesday.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton2() {
        if let text = TextFieldTuesday.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem2()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday2.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem2()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday3.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday4.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem2()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday5.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem2()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        if let text = TextFieldTuesday6.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ToDoListItem2()
            newItem.item = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        else {
            print("Add something")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}




