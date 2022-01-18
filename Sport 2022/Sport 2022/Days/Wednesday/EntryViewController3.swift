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
   
    
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton3(_ sender: Any) {
        didTapSaveButton3()
        playAudio3()
    }
    
    
    
    private let realm3 = try! Realm()
    public var completionHandlerWednesday: (() -> Void)?
    
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
            if let text2 = TextFieldWednesday2.text, !text.isEmpty {
                if let text3 = TextFieldWednesday3.text, !text.isEmpty {
                    if let text4 = TextFieldWednesday4.text, !text.isEmpty {
                            realm3.beginWrite()
                            let newItem = PlanDB()
                            newItem.name = text
                            newItem.approach = Int(text2) ?? 0
                            newItem.replay =  Int(text3) ?? 0
                            newItem.weight = Double(text4) ?? 0
                            realm3.add(newItem)
                            try! realm3.commitWrite()

                            completionHandlerWednesday?()
                            navigationController?.popToRootViewController(animated: true)
                            print(realm3.configuration.fileURL!)
                        }
                    }
                }
            }
        }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}




