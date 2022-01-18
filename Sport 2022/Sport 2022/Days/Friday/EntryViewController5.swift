//
//  EntryViewController5.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation

class EntryViewController5: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var TextFieldFriday: UITextField!
    @IBOutlet var TextFieldFriday2: UITextField!
    @IBOutlet var TextFieldFriday3: UITextField!
    @IBOutlet var TextFieldFriday4: UITextField!
    @IBOutlet var TextFieldFriday5: UITextField!
    @IBOutlet var TextFieldFriday6: UITextField!
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton5(_ sender: Any) {
            didTapSaveButton5()
            playAudio3()
    }
    
    
    
    private let realm5 = try! Realm()
    public var completionHandlerFriday: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldFriday.becomeFirstResponder()
        TextFieldFriday.delegate = self
        
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

    
    @objc func didTapSaveButton5() {
        if let text = TextFieldFriday.text, !text.isEmpty {
            if let text2 = TextFieldFriday2.text, !text.isEmpty {
                if let text3 = TextFieldFriday3.text, !text.isEmpty {
                    if let text4 = TextFieldFriday4.text, !text.isEmpty {
                            realm5.beginWrite()
                            let newItem = PlanDB()
                            newItem.name = text
                            newItem.approach = Int(text2) ?? 0
                            newItem.replay =  Int(text3) ?? 0
                            newItem.weight = Double(text4) ?? 0
                            realm5.add(newItem)
                            try! realm5.commitWrite()

                            completionHandlerFriday?()
                            navigationController?.popToRootViewController(animated: true)
                            print(realm5.configuration.fileURL!)
                        }
                    }
                }
            }
        }

    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}




