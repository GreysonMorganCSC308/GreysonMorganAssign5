//
//  ViewItemViewController.swift
//  GreysonMorganAssign5
//
//  Created by Morgan, Greyson F. on 4/18/26.
//

import UIKit

class ViewItemViewController: UIViewController {
    
    
    var itemName: String? = ""
    var itemDesc: String? = ""
    var itemCompleted: Bool? = false
    
    weak var delegate: ViewDataDelegate?
    
    @IBAction func switchToggled(_ sender: Any) {
        itemCompleted?.toggle()
        guard let comp = itemCompleted, let name = itemName else {
            return
        }
        delegate?.dataToPass(comp, name)
    }
    
    @IBAction func removeButtonHit(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Remove Item", style: .destructive) { (action) in
            
            self.delegate?.removeItem()
        }
        let noAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    @IBOutlet weak var descView: UITextView!
    @IBOutlet weak var compSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = itemName
        descView.text = itemDesc
        compSwitch.isOn = itemCompleted ?? false
        // Do any additional setup after loading the view.
    }

}

protocol ViewDataDelegate: AnyObject {
    func dataToPass(_ comp: Bool, _ name: String)
    func removeItem()
}
