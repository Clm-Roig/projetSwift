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
}
