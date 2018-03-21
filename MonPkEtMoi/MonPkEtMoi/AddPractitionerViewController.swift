//
//  AddPractitionerViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddPractitionerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()
    let specialismDAO = CoreDataDAOFactory.getInstance().getSpecialismDAO()
    
    var specialisms: [Specialism] = []
    
    @IBOutlet weak var specialismsPicker: UIPickerView!
    
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    
    
    @IBAction func addPractitioner(_ sender: Any) {
        if(lastNameTF.text != "" &&
            firstNameTF.text != "" && addressTF.text != "" && cityTF.text != "" &&  postalCodeTF.text != "") {
            
            var newPractitioner = Practitioner()
            do {
                newPractitioner = try practitionerDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Impossible de créer un médecin.")
            }
            
            newPractitioner.lastName = lastNameTF.text
            newPractitioner.firstName = firstNameTF.text
            newPractitioner.address = addressTF.text
            newPractitioner.postalCode = postalCodeTF.text
            newPractitioner.master = specialisms[specialismsPicker.selectedRow(inComponent: 0)]
            
            do {
                try practitionerDAO.save()
                navigationController?.popToViewController(self, animated: true)
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Impossible d'ajouter un médecin.")
            }
        }
        else {
            AlertHelper.alertWarning(view: self, warningMessage: "Veuillez remplir tous les champs.")
        }
        
    }
    // =============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.specialisms = try specialismDAO.getAll() as! [Specialism]
        } catch {
            fatalError("Erreur lors de l'obtention des spécialités.")
        }
        self.specialisms = self.specialisms.sorted {
            $0.wording! < $1.wording!
        }
    }
    
    //MARK: Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.specialisms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return specialisms[row].wording
    }

}
