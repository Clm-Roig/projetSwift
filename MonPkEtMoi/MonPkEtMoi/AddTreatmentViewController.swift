//
//  AddTreatmentViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 27/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddTreatmentViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
    var medicines: [Medicine?] = []
    var newTreatment: Treatment?
    var hoursTableViewCtrl: AddTreatmentHourTableViewController?
    
    @IBOutlet weak var medicinePicker: UIPickerView!
    @IBOutlet weak var quantityTF: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.frequencyL.text = "1"
        do {
            self.medicines = try treatmentDAO.getAllMedicines()
        } catch {
            fatalError("Erreur lors de l'obtention des médicaments.")
        }
        
        if(medicines.count > 1) {
            medicines = medicines.sorted {
                if let str1 = $0?.wording {
                    if let str2 = $1?.wording {
                        return str1 < str2
                    }
                    return false
                }
                return false
            }
        }
        
        self.hoursTableViewCtrl = AddTreatmentHourTableViewController(tableView: hoursTableView)
        
        self.hoursTableView.dataSource = hoursTableViewCtrl
        self.hoursTableView.delegate = hoursTableViewCtrl
       
    }
    
    
    // MARK: Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medicines.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medicines[row]?.wording
    }


}
