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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let comp = itemCompleted, let name = itemName else {
            return
        }
        print("got here")
        delegate?.dataToPass(comp, name)
    }

}

protocol DataDelegate: AnyObject {
    func dataToPass(_ comp: Bool, _ name: String)
}
