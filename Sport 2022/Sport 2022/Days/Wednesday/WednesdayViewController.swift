//
//  WednesdayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation

class WednesdayViewController: UITableViewController {
    
    let planDB = PlanDB()
    
    var player: AVAudioPlayer!
    
    let config = Realm.Configuration(schemaVersion: 4)
    lazy var realm = try! Realm(configuration: config)
    
    var exercises: Results<PlanDB>?


    func loadData() {
        do {
            let realm = try Realm()
            
            let userinfo = realm.objects(PlanDB.self)
            
            self.exercises = (userinfo)
            
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let item = exercises?[indexPath.row] {
                try! realm.write {
                    realm.delete(item)
                    playAudio2()
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
        playAudio()
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WednesdayTableViewCell.identifier, for: indexPath) as! WednesdayTableViewCell
        
        
        
        cell.configure((exercises?[indexPath.row])! )
        
        return cell
    }
    
}

