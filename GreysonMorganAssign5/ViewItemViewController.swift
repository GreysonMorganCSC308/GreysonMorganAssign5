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
    
    weak var delegate: DataDelegate?
    
    @IBAction func switchToggled(_ sender: Any) {
        itemCompleted?.toggle()
        guard let comp = itemCompleted, let name = itemName else {
            return
        }
        delegate?.dataToPass(comp, name)
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

protocol DataDelegate: AnyObject {
    func dataToPass(_ comp: Bool, _ name: String)
}
