//
//  AddViewController.swift
//  GreysonMorganAssign5
//
//  Created by Morgan, Greyson F. on 4/18/26.
//

import UIKit

class AddViewController: UIViewController {
    
    weak var delegate: AddDataDelegate?
    
    @IBAction func addButtonHit(_ sender: Any) {
        
        guard let name = nameField.text, !name.isEmpty, let desc = descField.text, let comp = compSwitch?.isOn else {
            let alert = UIAlertController(title: "Wait!", message: "Enter all information!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }
        delegate?.dataToAdd(name, desc, comp)
        nameField.text = ""
        descField.text = ""
        compSwitch.setOn(false, animated: false)
        let alert = UIAlertController(title: "Success!", message: "Item successfully added!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    @IBOutlet weak var compSwitch: UISwitch!
    @IBOutlet weak var descField: UITextView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        compSwitch.setOn(false, animated: false)
        // Do any additional setup after loading the view.
    }

}

protocol AddDataDelegate: AnyObject {
    func dataToAdd(_ name: String, _ desc: String, _ comp: Bool)
}
