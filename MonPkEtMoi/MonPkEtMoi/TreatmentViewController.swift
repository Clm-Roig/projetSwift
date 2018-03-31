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
    let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()

    var treatments: [Treatment?] = []
    var treatmentTableViewCtrl: TreatmentTableViewController?
    @IBOutlet weak var treatmentsTableView: UITableView!
    
    var medicationIntakes: [MedicationIntake?] = []
    var medicationIntakeTableViewCtrl: MedicationIntakeTableViewController?
    @IBOutlet weak var medicationIntakesTableView: UITableView!
    
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
        } catch let error {
            print(error)
            fatalError("Erreur lors de l'obtention des traitements.")
        }
        
        do {
            medicationIntakes = try medicationIntakeDAO.getAll()
        } catch let error {
            print(error)
            fatalError("Erreur lors de l'obtention des prises de médicaments.")
        }
        
        
        medicationIntakes = medicationIntakes.sorted {
            $0!.date! as Date > $1!.date! as Date
        }
                
        treatmentTableViewCtrl = TreatmentTableViewController(treatmentTableView: treatmentsTableView, treatments: treatments)
        treatmentsTableView.delegate = treatmentTableViewCtrl
        treatmentsTableView.dataSource = treatmentTableViewCtrl
        
        medicationIntakeTableViewCtrl = MedicationIntakeTableViewController(medicationIntakeTableView: medicationIntakesTableView, medicationIntakes: medicationIntakes)
        medicationIntakesTableView.delegate = medicationIntakeTableViewCtrl
        medicationIntakesTableView.dataSource = medicationIntakeTableViewCtrl
    }
    
    
    @IBAction func unwindToTreatments(segue:UIStoryboardSegue) {
        loadData()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
}
