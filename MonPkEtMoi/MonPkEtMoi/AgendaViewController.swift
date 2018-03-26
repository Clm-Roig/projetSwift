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
    
    var appointments: [Appointment?] = []
    var programs: [Program?] = []
    var treatments: [Treatment?] = []
    
    var appointmentsToday: [Appointment?] = []
    var programsToday: [Program?] = []
    var treatmentsToday: [Treatment?] = []
    
    var appointmentsLater: [Appointment?] = []
    var programsLater: [Program?] = []
    var treatmentsLater: [Treatment?] = []
    
    var tableViewTodoTodayCtrl: TodoTodayTableViewController?
    var tableViewTodoLaterCtrl: TodoLaterTableViewController?

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
        
        loadData()
    }
    
    func loadData() {
        do {
            self.appointments = try appointmentDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des rendez-vous.")
        }
        do {
            self.programs = try exerciseDAO.getAllPrograms()
        } catch {
            fatalError("Erreur lors de l'obtention des programmes.")
        }
        /* TODO: wait for treatmentDAO
         do {
         self.treatments = try treatmentsDAO.getAll()
         } catch {
         fatalError("Erreur lors de l'obtention des traitements.")
         }
         */
        
        appointmentsToday = []
        appointmentsLater = []
        programsToday = []
        programsLater = []
        treatmentsToday = []
        treatmentsLater = []
        
        // Separate today's TODOs and later's TODOs
        if (self.appointments.count > 0) {
            for app in self.appointments {
                if(Calendar.autoupdatingCurrent.isDateInToday(app!.date! as Date)) {
                    self.appointmentsToday.append(app)
                }
                else {
                    self.appointmentsLater.append(app)
                }
            }
        }
        if (self.programs.count > 0) {
            // A program specifies an exercise at least once a day
            for prog in self.programs {
                self.programsToday.append(prog)
                self.programsLater.append(prog)
            }
        }
        
        
        // Construct table view controller
        tableViewTodoTodayCtrl = TodoTodayTableViewController(todosTableView: self.todosTableViewToday, treatments: self.treatmentsToday, programs: self.programsToday, apppointments: self.appointmentsToday)
        self.todosTableViewToday.dataSource = self.tableViewTodoTodayCtrl
        self.todosTableViewToday.delegate = self.tableViewTodoTodayCtrl
        
        
        tableViewTodoLaterCtrl = TodoLaterTableViewController(todosTableView: self.todosTableViewLater, treatments: self.treatmentsLater, programs: self.programsLater, apppointments: self.appointmentsLater)
        self.todosTableViewLater.dataSource = self.tableViewTodoLaterCtrl
        self.todosTableViewLater.delegate = self.tableViewTodoLaterCtrl
    }
    
    override internal func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        
    }
    
    @IBAction func unwindToAgenda(segue:UIStoryboardSegue) {
        loadData()
    }
    
}
