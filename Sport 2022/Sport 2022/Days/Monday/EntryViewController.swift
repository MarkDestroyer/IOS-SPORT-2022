//
//  EntryViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import Firebase
import UIKit
import AVFoundation


class EntryViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var TextFieldMonday: UITextField!
    @IBOutlet var TextFieldMonday2: UITextField!
    @IBOutlet var TextFieldMonday3: UITextField!
    @IBOutlet var TextFieldMonday4: UITextField!
    @IBOutlet var TextFieldMonday5: UITextField!
    
    let ref = Database.database().reference(withPath: "userinfo/Monday exercises") // ссылка на контейнер/папку в Database
    var player: AVAudioPlayer!
    
    public var completionHandler: (() -> Void)?
    
    @IBAction func save(_ sender: Any) {
        didTapSaveButton()
        playAudio3()

    }
    
    
    var completionHandlerMonday: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextFieldMonday.becomeFirstResponder()
        TextFieldMonday.delegate = self
        
           ref.observe(.value, with: { snapshot in
               
               var exercises: [ExercisesFB] = []
               
               for child in snapshot.children {
                   if let snapshot = child as? DataSnapshot,
                      let exercise = ExercisesFB(snapshot: snapshot) {
                          exercises.append(exercise)
                   }
               }
         })
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
                        if let text5 = TextFieldMonday5.text, !text.isEmpty {
                            //Готовим модель
                            let exercise = ExercisesFB(name: text, approach: Int(text2) ?? 0, replay: Int(text3) ?? 0, weight: Double(text4) ?? 0, comment: text5)
                            
                            
                            let exersiseRef = self.ref.child(text)
                            
                            exersiseRef.setValue(exercise.toAnyObject())
                            
                            completionHandlerMonday?()
                            navigationController?.popToRootViewController(animated: true)
                        }
                    }
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}




