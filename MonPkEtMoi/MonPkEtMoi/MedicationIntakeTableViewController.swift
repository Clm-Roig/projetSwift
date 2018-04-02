//
//  MedicationIntakeTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//
import Foundation
import UIKit

class MedicationIntakeTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()
    
    var medicationIntakes: [MedicationIntake?] = []
    var medicationIntakeTableView: UITableView
    
    init(medicationIntakeTableView: UITableView, medicationIntakes: [MedicationIntake?]) {
        self.medicationIntakes = medicationIntakes
        self.medicationIntakeTableView = medicationIntakeTableView
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicationIntakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.medicationIntakeTableView.dequeueReusableCell(withIdentifier: "medicationIntakeCell", for: indexPath) as! MedicationIntakeTableViewCell
        
        cell.medicineWordingL.text = medicationIntakes[indexPath.row]?.wording
        
        // Not taken
        if Int((medicationIntakes[indexPath.row]?.delay)!) < 0 {
            cell.delayL.text = "❌"
        }
        // Little Delay
        else if Int((medicationIntakes[indexPath.row]?.delay)!) < 30 {
            cell.delayL.text = "✅"
        }
        // Important Delay
        else if Int((medicationIntakes[indexPath.row]?.delay)!) <= 60 {
            cell.delayL.text = "⏰"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"fr_FR")
        dateFormatter.dateFormat = "dd/MM/yyyy HH'h'mm"
        let hourToPrint = dateFormatter.string(from: (medicationIntakes[indexPath.row]?.date!)! as Date)
        
        cell.treatmentHourL.text = hourToPrint
        
        return cell
    }
    

}
