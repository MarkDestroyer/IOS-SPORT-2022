//
//  MondayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//


import RealmSwift
import UIKit

/*
 - To show list of current to do list itmes
 - To enter new to do list items
 - To show previously entered to do list item

 - Item
 - Date
 */

class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class MondayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    private let realm = try! Realm()

    var items : Results<ToDoListItem>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.items = realm.objects(ToDoListItem.self)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }

    // Mark: Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let item = items?[indexPath.row] {
                try! realm.write {
                    realm.delete(item)
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items![indexPath.row].item
        return cell
    }

    
    @IBAction func didTapAddButton() {
        guard let vc = storyboard?.instantiateViewController(identifier: "monday") as? EntryViewController else {
            return
        }
        vc.completionHandler = { [weak self] in
           self?.refresh()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    func refresh() {
        self.items = realm.objects(ToDoListItem.self)
        table.reloadData()
    }

}

