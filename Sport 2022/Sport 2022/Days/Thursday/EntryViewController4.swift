//
//  EntryViewController4.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation

class EntryViewController4: UIViewController, UITextFieldDelegate {

    @IBOutlet var TextFieldThursday: UITextField!
    @IBOutlet var TextFieldThursday2: UITextField!
    @IBOutlet var TextFieldThursday3: UITextField!
    @IBOutlet var TextFieldThursday4: UITextField!
    @IBOutlet var TextFieldThursday5: UITextField!
    @IBOutlet var TextFieldThursday6: UITextField!
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton4(_ sender: Any) {
        didTapSaveButton4()
        playAudio3()
    }
    
    
    
    private let realm4 = try! Realm()
    public var completionHandler4: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldThursday.becomeFirstResponder()
        TextFieldThursday.delegate = self
        
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

    @objc func didTapSaveButton4() {
        if let text = TextFieldThursday.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldThursday2.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldThursday3.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldThursday4.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldThursday5.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        if let text = TextFieldThursday6.text, !text.isEmpty {

            realm4.beginWrite()
            let newItem = ToDoListItem4()
            newItem.item = text
            realm4.add(newItem)
            try! realm4.commitWrite()

            completionHandler4?()
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




