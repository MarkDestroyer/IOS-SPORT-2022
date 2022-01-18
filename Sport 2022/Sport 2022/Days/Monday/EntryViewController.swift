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

    
    var player: AVAudioPlayer!
    
    public var completionHandler: (() -> Void)?
    
    @IBAction func save(_ sender: Any) {
        didTapSaveButton()
        playAudio3()

    }
    
    
    private let realm = try! Realm()
    var completionHandlerMonday: (() -> Void)?
    
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
            if let text2 = TextFieldMonday2.text, !text.isEmpty {
                if let text3 = TextFieldMonday3.text, !text.isEmpty {
                    if let text4 = TextFieldMonday4.text, !text.isEmpty {
                            realm.beginWrite()
                            let newItem = PlanDB()
                            newItem.name = text
                            newItem.approach = Int(text2) ?? 0
                            newItem.replay =  Int(text3) ?? 0
                            newItem.weight = Double(text4) ?? 0
                            realm.add(newItem)
                            try! realm.commitWrite()

                            completionHandlerMonday?()
                            navigationController?.popToRootViewController(animated: true)
                            print(realm.configuration.fileURL!)
                        }
                    }
                }
            }
        }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}




