//
//  ViewController.swift
//  GreysonMorganAssign5
//
//  Created by Morgan, Greyson F. on 4/18/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var toDoList = ["Example One", "Example Two"]
    var toDoDesc = ["This is a description for example item one.", "This is a description for example item two."]
    var toDoComp = [false, true]
    
    var selectedItem = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            selectedItem = indexPath.row
            self.performSegue(withIdentifier: "viewSegue", sender: self)
        default:
            break
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return toDoList.count
        case 1:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)
        if(indexPath.section == 0 && toDoComp[indexPath.row]) {
            cell = tableView.dequeueReusableCell(withIdentifier: "compCell", for: indexPath)
        } else if(indexPath.section == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "incompCell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath)
        }
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = toDoList[indexPath.row]
        case 1:
            cell.textLabel?.text = "Add Item"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "ToDo List"
        case 1:
            return "Add Item"
        default:
            return nil
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier) {
        case "viewSegue":
            guard let dest = segue.destination as? ViewItemViewController else {
                return
            }
            dest.itemName = toDoList[selectedItem]
            dest.itemDesc = toDoDesc[selectedItem]
            dest.itemCompleted = toDoComp[selectedItem]
            dest.delegate = self
            break
        default:
            break
        }
    }
}

extension ViewController: DataDelegate {
    func dataToPass(_ data: Bool, _ name: String) {
        if(toDoList.contains(name)) {
            guard let index = toDoList.firstIndex(of: name) else {
                return
            }
            toDoComp[index] = data
            
            tableView.reloadData()
        }
    }
}
