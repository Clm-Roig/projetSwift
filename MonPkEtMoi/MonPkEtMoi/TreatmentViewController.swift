//
//  TreatmentViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController {
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
  
    var medicineLabel: [String] = ["Matrix"]
    var quantityLabel: [String] = ["1 pilule rouge et 1 pilule bleue"]
    var hoursLabel: [String] = ["10h ; 18h","12h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h"]
  
    var treatments: [Treatment?] = []
    
    @IBOutlet weak var treatmentsList: UITableView!
    @IBAction func addTreatment(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        do {
            self.treatments = try treatmentDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des traitements.")
        }
        
        if(self.treatments.count > 0) {
            let tableViewCtrl = TreatmentTableViewController(treatmentTableView: self.treatmentsList, treatments: self.treatments)
            self.treatmentsList.delegate = tableViewCtrl
            self.treatmentsList.dataSource = tableViewCtrl
        }
    }

}
