//
//  PractitionerTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clm-Roig on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class PractitionerTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()

    var practitioners: [Practitioner]
    var practitionerTableView: UITableView
    
    init(practitionerTableView: UITableView, practitioners: [Practitioner]) {
        self.practitionerTableView = practitionerTableView
        self.practitioners = practitioners
    }
    
    //MARK: UITVDelegate and DataSource functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.practitioners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.practitionerTableView.dequeueReusableCell(withIdentifier: "practitionerCell", for: indexPath) as! PractitionerTableViewCell
        let practitioner = self.practitioners[indexPath.row]
        
        cell.nameSpecialismL.text = practitioner.lastName
        cell.nameSpecialismL.text = cell.nameSpecialismL.text! + " - "
        cell.nameSpecialismL.text = cell.nameSpecialismL.text! + (practitioner.master?.wording!)!
        cell.cityL.text = practitioner.city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            practitionerTableView.beginUpdates()
            practitionerDAO.delete(obj: practitioners[indexPath.row])
            do {
                try practitionerDAO.save()
            } catch {
                fatalError("Erreur à la suppression du médecin.")
            }
            practitionerTableView.deleteRows(at: [indexPath], with: .fade)
            practitioners.remove(at: indexPath.row)
            practitionerTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Supprimer"
    }
}
