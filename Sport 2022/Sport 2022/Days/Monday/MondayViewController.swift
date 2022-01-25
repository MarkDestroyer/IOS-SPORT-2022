//
//  MondayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//


import UIKit
import RealmSwift
import AVFoundation
import Firebase

class MondayViewController: UITableViewController {
    
    var player: AVAudioPlayer!
    
    private var exercises = [ExercisesFB]()
    private let ref = Database.database().reference(withPath: "userinfo/Monday exercises")
    
    let config = Realm.Configuration(schemaVersion: 4)
    lazy var realm = try! Realm(configuration: config)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
            ref.observe(.value, with: { snapshot in
                var exercises: [ExercisesFB] = []
                // 2
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                       let exercise = ExercisesFB(snapshot: snapshot) {
                           exercises.append(exercise)
                    }
                }
                // 3
                self.exercises = exercises
                self.tableView.reloadData()
            })

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let exercise = exercises[indexPath.row]
            exercise.ref?.removeValue()
        }
    }

    
    
    func playAudio() {
        let url = Bundle.main.url(forResource: "complete", withExtension: "mp3")
        
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
    
    func playAudio2() {
        let url = Bundle.main.url(forResource: "delete", withExtension: "mp3")
        
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
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let exercise = exercises[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MondayTableViewCell.identifier, for: indexPath) as! MondayTableViewCell
        
        cell.configure(exercise)
        
        
        return cell
    }
}

