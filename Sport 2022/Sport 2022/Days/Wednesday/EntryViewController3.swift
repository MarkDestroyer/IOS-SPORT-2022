//
//  EntryViewController3.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation

class EntryViewController3: UIViewController, UITextFieldDelegate {

    @IBOutlet var TextFieldWednesday: UITextField!
    @IBOutlet var TextFieldWednesday2: UITextField!
    @IBOutlet var TextFieldWednesday3: UITextField!
    @IBOutlet var TextFieldWednesday4: UITextField!
    @IBOutlet var TextFieldWednesday5: UITextField!
    @IBOutlet var TextFieldWednesday6: UITextField!
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton3(_ sender: Any) {
        didTapSaveButton3()
        playAudio3()
    }
    
    
    
    private let realm3 = try! Realm()
    public var completionHandler3: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldWednesday.becomeFirstResponder()
        TextFieldWednesday.delegate = self
        
    }
    
    public func playAudio3() {
        let url = Bundle.main.url(forResource: "save", withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print("\(error)")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton3() {
        if let text = TextFieldWednesday.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldWednesday2.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldWednesday3.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldWednesday4.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldWednesday5.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        if let text = TextFieldWednesday6.text, !text.isEmpty {

            realm3.beginWrite()
            let newItem = ToDoListItem3()
            newItem.item = text
            realm3.add(newItem)
            try! realm3.commitWrite()

            completionHandler3?()
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




