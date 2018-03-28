//
//  PractitionerViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class PractitionerViewController: UIViewController {
    let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()
    
    var practitionerViewCtrl: PractitionerTableViewController?
    var practitioners: [Practitioner?] = []
    
    @IBOutlet weak var practitionerTableView: UITableView!
    @IBOutlet weak var addPractitionerButton: UIButton!
    
    @IBAction func switchTouched(_ sender: UISwitch) {
        addPractitionerButton.isHidden = !addPractitionerButton.isHidden
    }    
    
    // ===================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addPractitionerButton.isHidden = true
        loadData()
    }
    
    func loadData() {
        do {
            try self.practitioners = practitionerDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des médecins.")
        }
        
        if(self.practitioners.count > 0) {
            self.practitionerViewCtrl = PractitionerTableViewController(practitionerTableView: self.practitionerTableView, practitioners: self.practitioners as! [Practitioner])
        }
        
        practitionerTableView.dataSource = self.practitionerViewCtrl
        practitionerTableView.delegate = self.practitionerViewCtrl
    }
    
    @IBAction func unwindToPractitionners(segue:UIStoryboardSegue) {
        loadData()
    }
    
}
