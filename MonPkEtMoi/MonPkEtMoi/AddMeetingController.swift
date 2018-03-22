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
    let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()

    var practitioners: [Practitioner?] = []
    
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
        
        // Get Data
        do {
            self.practitioners = try practitionerDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des médecins.")
        }
        
        self.practitioners = self.practitioners.sorted {
            if($0?.master?.wording == $1?.master?.wording) {
                return ($0?.lastName)! < ($1?.lastName)!
            }
            else {
                return ($0?.master?.wording)! < ($1?.master?.wording)!
            }
        }
        
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
        var title = practitioners[row]?.lastName?.uppercased()
        let firstName = practitioners[row]?.firstName
        let specialism = practitioners[row]?.master?.wording
        title = title! + " " + firstName! + " - " + specialism!
        return title
    }
    
}
