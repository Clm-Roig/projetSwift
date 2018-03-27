//
//  AddTreatmentHourTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 27/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddTreatmentHourTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var hours: [NSDate?] = []
    var nbHours: Int = 0
    var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nbHours
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "hourTreatmentCell", for: indexPath) as! TreatmentHourTableViewCell
        
        return cell
         */
        
        return TreatmentHourTableViewCell()
    }

}


