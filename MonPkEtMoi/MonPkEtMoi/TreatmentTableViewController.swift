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
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()

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
       
        var firstHour = true;
        let hoursTable = self.treatments[indexPath.row]?.hours
        
        // Everything is ready to manage [hours] even if we currently just 1 hour in the array
        if let hours = hoursTable {
            for hour in hours {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier:"fr_FR")
                dateFormatter.dateFormat = "HH'h'mm"
                let hourToPrint = dateFormatter.string(from: hour as Date)
                print(hourToPrint)
                
                if(firstHour) {
                    cell.hoursLabel.text = hourToPrint
                    firstHour = false
                }
                else {
                    cell.hoursLabel.text = "; " + hourToPrint
                }
                
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            treatmentTableView.beginUpdates()
            treatmentDAO.delete(obj: treatments[indexPath.row]!)
            do {
                try treatmentDAO.save()
            } catch {
                fatalError("Erreur à la suppression du traitement.")
            }
            treatmentTableView.deleteRows(at: [indexPath], with: .fade)
            treatments.remove(at: indexPath.row)
            treatmentTableView.endUpdates()
        }
    }
    
}
