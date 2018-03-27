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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.medicines = try treatmentDAO.getAllMedicines()
        } catch {
            fatalError("Erreur lors de l'obtention des médicaments.")
        }
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
