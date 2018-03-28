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
    
    @IBOutlet weak var medicinePicker: UIPickerView!
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!


    @IBAction func hourStepperPressed(_ sender: UIStepper) {
        self.hourLabel.text = String(Int(sender.value))
    }
    
    @IBAction func minuteStepperPressed(_ sender: UIStepper) {
        self.minuteLabel.text = String(Int(sender.value))
    }

    
    
    @IBAction func addTreatment(_ sender: Any) {
        if(self.quantityTF.text != "") {
            var treatment:Treatment?
            do {
                treatment = try treatmentDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création du nouveau traitement.")
            }
            guard let newTreatment = treatment else {
                fatalError()
            }
            
            newTreatment.beginningDate = Date() as NSDate
            newTreatment.endingDate = datePicker.date as NSDate
            
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let hour = formatter.date(from: hourLabel.text! + ":" + minuteLabel.text!)
            newTreatment.hours = [hour! as NSDate];
            newTreatment.quantity = quantityTF.text
            newTreatment.need = medicines[medicinePicker.selectedRow(inComponent: 0)]
            
            do {
                try treatmentDAO.save()
                performSegue(withIdentifier: "unwindSegueToTreatments", sender: self)
            } catch let error {
                print(error)
                fatalError("Erreur à la sauvegarde d'un traitement")
            }
            
        }
        else {
            AlertHelper.alertWarning(view: self, warningMessage: "Veuillez saisir une posologie.")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.minimumDate = Date()

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
