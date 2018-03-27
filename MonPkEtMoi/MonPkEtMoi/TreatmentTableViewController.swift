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
    
    var treatments: [Treatment?] = []
    var treatmentTableView: UITableView
    
    init(treatmentTableView: UITableView, treatments: [Treatment?]) {
        self.treatments = treatments
        self.treatmentTableView = treatmentTableView
        super.init()
    }
    
    //MARK: UITVDelegate and DataSource functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.treatments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.treatmentTableView.dequeueReusableCell(withIdentifier: "treatmentCell", for: indexPath) as! TreatmentTableViewCell
        cell.medicineLabel.text = self.treatments[indexPath.row]?.need?.wording
        cell.quantityLabel.text = self.treatments[indexPath.row]?.quantity
       
        /*
        let hoursTable = self.treatments[indexPath.row]?.hours
        if let hours = hoursTable {
            for hour in hours {
                cell.hoursLabel.text = cell.hoursLabel.text! + String(Calendar.current.component(.hour, from: hour as Date))
            }
        }
         */
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    // TODO : delete not complete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
