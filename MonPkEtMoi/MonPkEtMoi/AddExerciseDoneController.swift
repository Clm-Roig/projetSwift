//
//  AddExerciseDoneController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddExerciseController: UIViewController {
    let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()
    
    @IBOutlet weak var activityTF: UITextField!
    @IBOutlet weak var durationL: UILabel!
    
    @IBAction func durationStepperTouched(_ sender: UIStepper) {
        durationL.text = String(Int(sender.value))
    }
    
    @IBAction func addExerciseDone(_ sender: Any) {
        if(activityTF.text != "") {
            var newExerciseDone = ExerciseDone()
            var newExercise = Exercise()
            do {
                newExerciseDone = try exerciseDAO.createExerciseDone()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création de l'exercice effectué.")
            }
            
            do {
                newExercise = try exerciseDAO.create()
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la création de l'exercice.")
            }
            
            newExercise.wording = activityTF.text
            newExerciseDone.date = Date() as NSDate
            newExerciseDone.duration = Int16(durationL.text!)!
            newExerciseDone.concerns = newExercise
            
            do {
                try exerciseDAO.save()
                performSegue(withIdentifier: "unwindSegueToExercises", sender: self)
            } catch {
                AlertHelper.alertError(view: self, errorMessage: "Erreur à la sauvegarde de l'exercice effectué.")
            }
        }
        else {
            AlertHelper.alertWarning(view: self, warningMessage: "Veuillez renseigner une activité.")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationL.text = "5"
    }
    
}
