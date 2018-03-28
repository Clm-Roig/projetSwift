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
  
    var treatments: [Treatment?] = []
    var tableViewCtrl: TreatmentTableViewController?
    
    @IBOutlet weak var treatmentsTableView: UITableView!
    @IBOutlet weak var addTreatmentButton: MyUIButton!
    
    @IBAction func switchTouched(_ sender: UISwitch) {
        self.addTreatmentButton.isHidden = !self.addTreatmentButton.isHidden
    }
    
    // =======================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTreatmentButton.isHidden = true
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
                
        self.tableViewCtrl = TreatmentTableViewController(treatmentTableView: self.treatmentsTableView, treatments: self.treatments)
        self.treatmentsTableView.delegate = self.tableViewCtrl
        self.treatmentsTableView.dataSource = self.tableViewCtrl
    }
    
    @IBAction func unwindToTreatments(segue:UIStoryboardSegue) {
        loadData()
    }

}
