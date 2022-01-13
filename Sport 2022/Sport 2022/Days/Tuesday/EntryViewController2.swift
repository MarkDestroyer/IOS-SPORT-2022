//
//  EntryViewController2.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation

class EntryViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet var TextFieldTuesday: UITextField!
    @IBOutlet var TextFieldTuesday2: UITextField!
    @IBOutlet var TextFieldTuesday3: UITextField!
    @IBOutlet var TextFieldTuesday4: UITextField!
    @IBOutlet var TextFieldTuesday5: UITextField!
    @IBOutlet var TextFieldTuesday6: UITextField!
    var player: AVAudioPlayer!
    
    @IBAction func save2(_ sender: Any) {
        didTapSaveButton2()
        playAudio3()
    }
    
    
    
    private let realm2 = try! Realm()
    public var completionHandler2: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldTuesday.becomeFirstResponder()
        TextFieldTuesday.delegate = self
        
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

    @objc func didTapSaveButton2() {
        if let text = TextFieldTuesday.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday2.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday3.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday4.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        if let text = TextFieldTuesday5.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
            realm2.add(newItem)
            try! realm2.commitWrite()

            completionHandler2?()
            navigationController?.popToRootViewController(animated: true)
        }
        
        
        if let text = TextFieldTuesday6.text, !text.isEmpty {

            realm2.beginWrite()
            let newItem = ExercisesDB()
            newItem.name = text
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




