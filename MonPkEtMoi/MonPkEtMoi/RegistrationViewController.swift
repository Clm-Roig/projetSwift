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
    @IBOutlet weak var birthDateDP: UIDatePicker!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    
    @IBAction func createAccountButton(_ sender: Any) {
        // All TF must not be empty
        if(self.lastNameTF.text != "" && self.firstNameTF.text != "") {

        }
        else {
            
        }
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad();
        
    }
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
    }
    

}
