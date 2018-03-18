//
//  ProfileController.swift
//  MonPkEtMoi
//
//  Created by Melvil Donnart on 18/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    var patientDAO: CDPatientDAO = CDPatientDAO()
    var patient: Patient? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.patient = self.patientDAO.get()
        if let patient = self.patient {
            print(patient.lastName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
