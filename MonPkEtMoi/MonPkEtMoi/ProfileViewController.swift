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
    let patientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()
    
    var patient: Patient? = nil
    
    @IBOutlet weak var fullNameL: UILabel!
    @IBOutlet weak var birthDateL: UILabel!
    @IBOutlet weak var addressL: UILabel!
    @IBOutlet weak var cityCPL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            self.patient = try self.patientDAO.get()
        } catch {
            // TODO : show alert
            AlertHelper.alertError(view: self, errorMessage: "Error getting patient.")
        }
        
        guard let patient = self.patient else {
            fatalError("No patient registered")
        }

        self.fullNameL.text = patient.firstName! + " " + patient.lastName!.uppercased()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        self.birthDateL.text = "Né(e) le " + dateFormatter.string(from: patient.birthDate! as Date)
        
        self.addressL.text = patient.address!
        self.cityCPL.text = patient.postalCode! + " " + patient.city!.uppercased()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
