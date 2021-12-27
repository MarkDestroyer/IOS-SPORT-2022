//
//  FridayViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 25.12.2021.
//

import UIKit
import RealmSwift


class ToDoListItem5: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}

class FridayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet var table5: UITableView!
    
    
    private let realm5 = try! Realm()

    var items5 : Results<ToDoListItem5>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items5 = realm5.objects(ToDoListItem5.self)
        table5.register(UITableViewCell.self, forCellReuseIdentifier: "cell5")
        table5.delegate = self
        table5.dataSource = self
    }

    // Mark: Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items5!.count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let item = items5?[indexPath.row] {
                try! realm5.write {
                    realm5.delete(item)
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
        cell.textLabel?.text = items5![indexPath.row].item
        return cell
    }
    
    @IBAction func didTapAddButton5(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "friday") as? EntryViewController5 else {
            return
        }
        vc.completionHandler5 = { [weak self] in
            self?.refresh5()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    func refresh5() {
        items5 = realm5.objects(ToDoListItem5.self)
        table5.reloadData()
    }

}
