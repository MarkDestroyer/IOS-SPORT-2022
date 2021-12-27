//
//  ThursdayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift


class ToDoListItem4: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class ThursdayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet var table4: UITableView!
    
    
    private let realm4 = try! Realm()

    var items4 : Results<ToDoListItem4>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items4 = realm4.objects(ToDoListItem4.self)
        table4.register(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        table4.delegate = self
        table4.dataSource = self
    }

    // Mark: Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items4!.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let item = items4?[indexPath.row] {
                try! realm4.write {
                    realm4.delete(item)
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
        cell.textLabel?.text = items4![indexPath.row].item
        return cell
    }
    
    @IBAction func didTapAddButton4(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "thursday") as? EntryViewController4 else {
            return
        }
        vc.completionHandler4 = { [weak self] in
            self?.refresh4()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    func refresh4() {
        items4 = realm4.objects(ToDoListItem4.self)
        table4.reloadData()
    }

}
