//
//  RegistrationViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit
import CoreData

class RegistrationViewController : UIViewController {
    
    let patientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()
    
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var birthDateTF: UITextField!
    @IBOutlet weak var textIntro: UITextView!
    
    // The DatePicker update the value in the birthDateTF.
    @IBOutlet weak var birthDateDP: UIDatePicker!
    @IBAction func birthDateTFEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = self.birthDateDP
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged
        )
    }
    @IBAction func birthDateDPEditing(_ sender: Any) {
        self.datePickerValueChanged(sender:self.birthDateDP)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        birthDateTF.text = dateFormatter.string(from: sender.date)
    }
    
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    
    @IBAction func createAccountButton(_ sender: Any) {
        if( self.lastNameTF.text != "" && self.firstNameTF.text != "" &&
            self.birthDateTF.text != "" && self.addressTF.text != "" &&
            self.cityTF.text != "" && self.postalCodeTF.text != ""
        ) {
            // Construct a new patient
            var newPatient = Patient()
            do {
                newPatient = try self.patientDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création du patient.")
            }
            
            newPatient.firstName = firstNameTF.text
            newPatient.lastName = lastNameTF.text
            newPatient.birthDate = birthDateDP.date as NSDate
            newPatient.address = addressTF.text
            newPatient.city = cityTF.text
            newPatient.postalCode = postalCodeTF.text
            
            // Save the patient
            do {
                try patientDAO.save()
                // Set UserDefaults variable to true and navigate to Home
                UserDefaults.standard.set(true, forKey: "patientRegistered")
                self.performSegue(withIdentifier: "registrationOkSegue", sender: self)
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la sauvegarde du patient.")
            }
            
        }
        else {
            // create the alert
            let alert = UIAlertController(title: "Formulaire incomplet", message: "Veuillez remplir tous les champs.", preferredStyle: UIAlertControllerStyle.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad();
        
        self.textIntro.isEditable = false
    }
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }
    

}
