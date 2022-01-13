//
//  WednesdayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift
import AVFoundation



class WednesdayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet var table3: UITableView!
    
    private let realm3 = try! Realm()

    var items3 : Results<ExercisesDB>?
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items3 = realm3.objects(ExercisesDB.self)
        table3.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        table3.delegate = self
        table3.dataSource = self
        refresh3()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
        playAudio()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items3!.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let item = items3?[indexPath.row] {
                try! realm3.write {
                    realm3.delete(item)
                    playAudio2()
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        cell.textLabel?.text = items3![indexPath.row].name
        return cell
    }
    
    @IBAction func didTapAddButton3(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "wednesday") as? EntryViewController3 else {
            return
        }
        vc.completionHandler3 = { [weak self] in
            self?.refresh3()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    func refresh3() {
        self.items3 = realm3.objects(ExercisesDB.self)
        table3.reloadData()
    }

}
