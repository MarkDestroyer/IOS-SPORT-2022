//
//  EntryViewController5.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import AVFoundation
import Firebase

class EntryViewController5: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var TextFieldFriday: UITextField!
    @IBOutlet var TextFieldFriday2: UITextField!
    @IBOutlet var TextFieldFriday3: UITextField!
    @IBOutlet var TextFieldFriday4: UITextField!
    @IBOutlet var TextFieldFriday5: UITextField!
    
    let ref = Database.database().reference(withPath: "userinfo/Friday exercises") // ссылка на контейнер/папку в Database
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton5(_ sender: Any) {
            didTapSaveButton5()
            playAudio3()
    }
    
    
    
    public var completionHandlerFriday: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldFriday.becomeFirstResponder()
        TextFieldFriday.delegate = self
        
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

    
    @objc func didTapSaveButton5() {
        if let text = TextFieldFriday.text, !text.isEmpty {
            if let text2 = TextFieldFriday2.text, !text.isEmpty {
                if let text3 = TextFieldFriday3.text, !text.isEmpty {
                    if let text4 = TextFieldFriday4.text, !text.isEmpty {
                        if let text5 = TextFieldFriday5.text, !text.isEmpty {
                            //Готовим модель
                            let exercise = ExercisesFB(name: text, approach: Int(text2) ?? 0, replay: Int(text3) ?? 0, weight: Double(text4) ?? 0, comment: text5)
                            
                            
                            let exersiseRef = self.ref.child(text)
                            
                            
                            exersiseRef.setValue(exercise.toAnyObject())
                            
                            completionHandlerFriday?()
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




