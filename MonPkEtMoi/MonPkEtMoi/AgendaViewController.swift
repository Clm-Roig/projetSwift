//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController {
    let programDAO = CoreDataDAOFactory.getInstance().getProgramDAO()
    let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
    
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
    
    @IBAction func switchTouched(_ sender: UISwitch) {
        self.addButton.isHidden = !self.addButton.isHidden
    }

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
        
        self.addButton.isHidden = true
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        do {
            self.appointments = try appointmentDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des rendez-vous.")
        }
        do {
            self.programs = try programDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des programmes.")
        }
        do {
            self.treatments = try treatmentDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des traitements.")
        }
        
        appointmentsToday = []
        appointmentsLater = []
        programsToday = []
        programsLater = []
        treatmentsToday = []
        treatmentsLater = []
        
        // Separate today's TODOs and later's TODOs
        if (self.appointments.count > 0) {
            for app in self.appointments {
                guard let app = app else {
                    return
                }
                // Is it today ? And is it passed ?
                if(app.date! as Date > Date()){
                    if(Calendar.autoupdatingCurrent.isDateInToday(app.date! as Date)) {
                        self.appointmentsToday.append(app)
                    }
                    else {
                        self.appointmentsLater.append(app)
                    }
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
        if (self.treatments.count > 0) {
            for treatment in self.treatments {
                guard let treatment = treatment else {
                    return
                }
                // Ending date passed ?
                if((treatment.endingDate! as Date) > Date()) {
                    self.treatmentsLater.append(treatment)
                    
                    // Hour of medication intake passed ?
                    // Displays a treatment during all the hour of the medication-intake hour (prevent the patient to forget).
                    let hourNotPassed = Calendar.current.component(.hour, from: treatment.hour! as Date) >= Calendar.current.component(.hour, from: Date())
                    if hourNotPassed {
                        self.treatmentsToday.append(treatment)
                    }
                }
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
    
    
    @IBAction func unwindToAgenda(segue:UIStoryboardSegue) {
        loadData()
    }
    
}
