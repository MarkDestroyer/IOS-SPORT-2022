//
//  EntryViewController3.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import AVFoundation
import Firebase

class EntryViewController3: UIViewController, UITextFieldDelegate {

    @IBOutlet var TextFieldWednesday: UITextField!
    @IBOutlet var TextFieldWednesday2: UITextField!
    @IBOutlet var TextFieldWednesday3: UITextField!
    @IBOutlet var TextFieldWednesday4: UITextField!
    @IBOutlet var TextFieldWednesday5: UITextField!
   
    let ref = Database.database().reference(withPath: "userinfo/Wednesday exercises") // ссылка на контейнер/папку в Database
    
    var player: AVAudioPlayer!
    
    
    @IBAction func didTapSaveButton3(_ sender: Any) {
        didTapSaveButton3()
        playAudio3()
    }
    
    
    
    
    public var completionHandlerWednesday: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldWednesday.becomeFirstResponder()
        TextFieldWednesday.delegate = self
        
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

    @objc func didTapSaveButton3() {
        if let text = TextFieldWednesday.text, !text.isEmpty {
            if let text2 = TextFieldWednesday2.text, !text.isEmpty {
                if let text3 = TextFieldWednesday3.text, !text.isEmpty {
                    if let text4 = TextFieldWednesday4.text, !text.isEmpty {
                        if let text5 = TextFieldWednesday5.text, !text.isEmpty {
                            //Готовим модель
                            let exercise = ExercisesFB(name: text, approach: Int(text2) ?? 0, replay: Int(text3) ?? 0, weight: Double(text4) ?? 0, comment: text5)
                            
                            
                            let exersiseRef = self.ref.child(text)
                            
                            
                            exersiseRef.setValue(exercise.toAnyObject())
                            
                            completionHandlerWednesday?()
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




