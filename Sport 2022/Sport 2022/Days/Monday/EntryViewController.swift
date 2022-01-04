//
//  EntryViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import RealmSwift
import UIKit
import AVFoundation

class EntryViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var TextFieldMonday: UITextField!
    @IBOutlet var TextFieldMonday2: UITextField!
    @IBOutlet var TextFieldMonday3: UITextField!
    @IBOutlet var TextFieldMonday4: UITextField!
    @IBOutlet var TextFieldMonday5: UITextField!
    @IBOutlet var TextFieldMonday6: UITextField!
    var player: AVAudioPlayer!
    
    @IBAction func save(_ sender: Any) {
        didTapSaveButton()
        playAudio3()
    }
    
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextFieldMonday.becomeFirstResponder()
        TextFieldMonday.delegate = self
        
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




