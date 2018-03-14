//
//  RegistrationViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class RegistrationViewController : UIViewController {
    
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var birthDateTF: UITextField!
    
    
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
        //dateFormatter.timeStyle = DateFormatter.Style.none
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
            let user = Patient();
            user.firstName = firstNameTF.text
            user.lastName = lastNameTF.text
            user.birthDate = birthDateDP.date as NSDate
            user.address = addressTF.text
            user.city = cityTF.text
            user.postalCode = postalCodeTF.text

            UserDefaults.standard.set(true, forKey: "patientRegistered")
            self.performSegue(withIdentifier: "registrationOkSegue", sender: self)
        }
        else {
            print("empty input(s)")
        }
    }
    
    
    
    
    
    override internal func viewDidLoad() {
        super.viewDidLoad();
        
    }
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }
    

}
