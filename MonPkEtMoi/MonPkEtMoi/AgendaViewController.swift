//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Matthieu DYE on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func `switch`(_ sender: Any) {
    }
  
    @IBOutlet weak var todoListToday: UITableView!
    @IBOutlet weak var todoListLater: UITableView!
    
    override internal func viewDidLoad() {
        
    }
    
    override internal func didReceiveMemoryWarning() {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = self.treatmentsList.dequeueReusableCell(withIdentifier: "treatmentCell", for: indexPath) as! TreatmentTableViewCell
        cell.medicineLabel.text = self.medicineLabel[indexPath.row]
        cell.quantityLabel.text = self.quantityLabel[indexPath.row]
        cell.hoursLabel.text = self.hoursLabel[indexPath.row]
        return cell
         */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
       
        //return self.medicineLabel.count
    }
    
    
}
