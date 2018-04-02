//
//  AddProgramController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddProgramController: UIViewController {
    let programDAO = CoreDataDAOFactory.getInstance().getProgramDAO()
    let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()

    @IBOutlet weak var activityTF: UITextField!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var frequency: UILabel!
    
    @IBAction func durationStepperTouched(_ sender: UIStepper) {
        self.duration.text = String(Int(sender.value))
    }
    
    
    @IBAction func frequencyStepperTouched(_ sender: UIStepper) {
        self.frequency.text = String(Int(sender.value))
    }
    
    @IBAction func addProgram(_ sender: Any) {
        if(activityTF.text != "") {
            var newProgram = Program()
            var newExercise = Exercise()
            do {
                newProgram = try programDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création du programme.")
            }
            
            do {
                newExercise = try exerciseDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création de l'exercice.")
            }
            
            newExercise.wording = activityTF.text
            newProgram.isComposedBy = newExercise
            newProgram.duration = Int16(duration.text!)!
            newProgram.frequency = Int16(frequency.text!)!
            
            do {
                try exerciseDAO.save()
                performSegue(withIdentifier: "unwindSegueToExercises", sender: self)
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la sauvegarde du programme.")
            }
        }
        else {
            AlertHelper.alertWarning(view: self, warningMessage: "Veuillez renseigner une activité.")
        }
    }
    
    // =======================================
    override func viewDidLoad() {
        super.viewDidLoad()
        frequency.text = "1"
        duration.text = "5"
    }
    
}
