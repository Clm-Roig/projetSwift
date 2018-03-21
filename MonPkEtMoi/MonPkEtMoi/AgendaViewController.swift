//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController {
    let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()
    let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()
    
    // TODO : wait for TreatmentDAO
    //let treatmentDAO = CoreDataDAOFactory.getInstance().geTreatmentDAO()


    // TODO : Use Core Data instead of hardcoded String
    var appointmentsToday: [String] = ["RDV : Docteur Martin"]
    var treatmentsToday: [String] = ["Modopar 100"]
    var exercisesToday: [String] = ["Exercice : catch"]
    
    var appointmentsLater: [String] = ["RDV : Docteur Dupont"]
    var treatmentsLater: [String] = ["Modopar 125"]
    var exercisesLater: [String] = ["Exercice : jardinage"]
    
    var appointments: [Appointment?] = []
    var exercises: [Exercise?] = []
    var treatments: [Treatment?] = []
    
    var tableViewTodoTodayCtrl: TodoTableViewController?
    var tableViewTodoLaterCtrl: TodoTableViewController?

    @IBOutlet weak var todosTableViewToday: UITableView!
    @IBOutlet weak var todosTableViewLater: UITableView!
   
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var laterLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!

    // ----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Labels
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "FR-fr")
        formatter.dateFormat = "dd MMMM yyyy"
        let dateString = formatter.string(from: date)
        self.todayLabel.text = "Aujourd'hui " + dateString
        self.laterLabel.text = "A venir"
        
        // Get Data
        do {
            self.appointments = try appointmentDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des rendez-vous.")
        }
        do {
            self.exercises = try exerciseDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des exercices.")
        }
        /* TODO: wait for treatmentDAO
        do {
            self.treatments = try treatmentsDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des traitements.")
        }
         */
        
        // TODO : get todos from Core Data before passing them to Ctrl
        tableViewTodoTodayCtrl = TodoTableViewController(todosTableView: self.todosTableViewToday, treatments: self.treatmentsToday, exercises: self.exercisesToday, apppointments: self.appointmentsToday)
        self.todosTableViewToday.dataSource = self.tableViewTodoTodayCtrl
        self.todosTableViewToday.delegate = self.tableViewTodoTodayCtrl
        
        tableViewTodoLaterCtrl = TodoTableViewController(todosTableView: self.todosTableViewLater, treatments: self.treatmentsLater, exercises: self.exercisesLater, apppointments: self.appointmentsLater)
        self.todosTableViewLater.dataSource = self.tableViewTodoTodayCtrl
        self.todosTableViewLater.delegate = self.tableViewTodoTodayCtrl

    }
    
    override internal func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        
    }
    
}
