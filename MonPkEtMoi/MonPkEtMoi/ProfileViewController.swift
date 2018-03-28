//
//  ProfileController.swift
//  MonPkEtMoi
//
//  Created by Melvil Donnart on 18/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    let patientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()
    
    var patient: Patient? = nil
    
    @IBOutlet weak var fullNameL: UILabel!
    @IBOutlet weak var birthDateL: UILabel!
    @IBOutlet weak var addressL: UILabel!
    @IBOutlet weak var cityCPL: UILabel!
    @IBOutlet weak var beginningHourL: UILabel!
    @IBOutlet weak var endingHourL: UILabel!
    @IBOutlet weak var preparationTimeL: UILabel!
    
    @IBOutlet weak var beginningHourStepper: UIStepper!
    @IBOutlet weak var endingHourStepper: UIStepper!
    @IBOutlet weak var preparationTimeStepper: UIStepper!
    
    @IBAction func beginningHourStepperPressed(_ sender: UIStepper) {
        // Beginning hour can't be after ending hour
        if(endingHourStepper.value == beginningHourStepper.value) {
            beginningHourStepper.value = beginningHourStepper.value - 1
        }
        else {
            self.beginningHourL.text = String(Int(beginningHourStepper.value))
            
            patient?.beginningEvaluationHour = Int16(beginningHourStepper.value)
            do {
                try patientDAO.save()
            } catch {
                AlertHelper.alertWarning(view: self, warningMessage: "Erreur à la sauvegarde de l'heure de début des évaluations.")
            }
        }
    }

    @IBAction func endingHourStepperPressed(_ sender: UIStepper) {
        // Ending hour can't be before beginning hour
        if(endingHourStepper.value == beginningHourStepper.value) {
            endingHourStepper.value = endingHourStepper.value + 1
        }
        else {
            self.endingHourL.text = String(Int(endingHourStepper.value))
            
            patient?.endingEvaluationHour = Int16(endingHourStepper.value)
            do {
                try patientDAO.save()
            } catch {
                AlertHelper.alertWarning(view: self, warningMessage: "Erreur à la sauvegarde de l'heure de fin des évaluations.")
            }
        }
    }
 
    
    @IBAction func preparationTimeStepperPressed(_ sender: UIStepper) {
        self.preparationTimeL.text = String(Int(preparationTimeStepper.value))
        
        patient?.timePeparation = Int16(preparationTimeStepper.value)
        do {
            try patientDAO.save()
        } catch {
            AlertHelper.alertWarning(view: self, warningMessage: "Erreur à la sauvegarde du temps de préparation.")
        }
    }
    
    
    
    // ==================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        guard let patient = self.patient else {
            fatalError("No patient registered")
        }
        
        // Set all the labels
        self.fullNameL.text = patient.firstName! + " " + patient.lastName!.uppercased()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        self.birthDateL.text = "Né(e) le " + dateFormatter.string(from: patient.birthDate! as Date)
        
        self.addressL.text = patient.address!
        self.cityCPL.text = patient.postalCode! + " " + patient.city!.uppercased()
        
        self.beginningHourL.text = String(patient.beginningEvaluationHour)
        self.beginningHourStepper.value = Double(patient.beginningEvaluationHour)
        self.endingHourL.text = String(patient.endingEvaluationHour)
        self.endingHourStepper.value = Double(patient.endingEvaluationHour)
        self.preparationTimeL.text = String(patient.timePeparation)
        self.preparationTimeStepper.value = Double(patient.timePeparation)

    }
    
    func loadData() {
        do {
            self.patient = try self.patientDAO.get()
        } catch {
            AlertHelper.alertError(view: self, errorMessage: "Error getting patient.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
