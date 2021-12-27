//
//  EntryViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var TextFieldMonday: UITextField!
    @IBOutlet var TextFieldMonday2: UITextField!
    @IBOutlet var TextFieldMonday3: UITextField!
    @IBOutlet var TextFieldMonday4: UITextField!
    @IBOutlet var TextFieldMonday5: UITextField!
    @IBOutlet var TextFieldMonday6: UITextField!
    
    
    @IBAction func save(_ sender: Any) {
        didTapSaveButton()
    }
    
    
    
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        TextFieldMonday.becomeFirstResponder()
        TextFieldMonday.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton() {
        if let text = TextFieldMonday.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldMonday2.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldMonday3.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldMonday4.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldMonday5.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        if let text = TextFieldMonday6.text, !text.isEmpty {

            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.item = text
            realm.add(newItem)
            try! realm.commitWrite()

            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        else {
            print("Add something")
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


