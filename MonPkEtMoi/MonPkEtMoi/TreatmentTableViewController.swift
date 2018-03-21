//
//  TreatmentTableViewController.swift
//  MonPkEtMoi
//
//  Created by Matthieu DYE on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class TreatmentTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var treatments: [Treatment] = []
    var treatmentTableView: UITableView
    
    init(treatmentTableView: UITableView, treatments: [Treatment]) {
        self.treatmentTableView = treatmentTableView
        self.treatments = treatments
    }
    
    //MARK: UITVDelegate and DataSource functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.treatments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.treatmentTableView.dequeueReusableCell(withIdentifier: "treatmentCell", for: indexPath) as! TreatmentTableViewCell
        let treatment = self.treatments[indexPath.row]
        
        cell.hoursLabel.text = "7"
        cell.medicineLabel.text = "Modopar"
        cell.quantityLabel.text = "125mg"
        
       /* cell.nameSpecialismL.text = practitioner.lastName
        cell.nameSpecialismL.text = cell.nameSpecialismL.text! + " - "
        cell.nameSpecialismL.text = cell.nameSpecialismL.text! + (practitioner.master?.wording!)!
        cell.cityL.text = self.practitioners[indexPath.row].city
        */
        return cell
    }
}
