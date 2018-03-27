//
//  AddTreatmentView1Controller.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 27/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddTreatmentView1Controller: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
    var medicines: [Medicine?] = []
    var newTreatment: Treatment?
    
    @IBOutlet weak var medicinePicker: UIPickerView!
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var frequencyL: UILabel!
    @IBOutlet weak var frequencyStepper: UIStepper!
    
    @IBAction func frequencyStepperPressed(_ sender: UIStepper) {
        self.frequencyL.text = String(Int(sender.value))
    }
    
    @IBAction func addDates(_ sender: Any) {
        if(quantityTF.text != "") {
            self.newTreatment = Treatment()
            self.newTreatment!.quantity = quantityTF.text
            self.newTreatment!.hours = []
            self.newTreatment!.need = medicines[medicinePicker.selectedRow(inComponent: 0)]
        }
    }
    
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
       
    }
    
    
    /// Passes the new Treatment to the next view through the sergue
    ///
    /// - Parameters:
    ///   - segue: <#segue description#>
    ///   - sender: <#sender description#>
    ///   - newTreatment: <#newTreatment description#>
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view2Controller = segue.destination as! AddTreatmentView2Controller
        view2Controller.treatmentPassed = self.newTreatment!
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
