//
//  AddMeetingController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddMeetingController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var practitioners: [String] = ["Jean", "Pierre", "Marie", "Isabelle"]
    
    @IBOutlet weak var practitionerPicker: UIPickerView!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBAction func stepper(_ sender: UIStepper) {
        self.durationLabel.text = String(Int(sender.value))
    }
    
    @IBAction func addMeetingButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.practitioners.sort()
        self.durationLabel.text = "0"
    }
    
    // MARK: Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return practitioners.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return practitioners[row]
    }
    
}
