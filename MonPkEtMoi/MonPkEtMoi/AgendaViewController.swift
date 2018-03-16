//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController {
    
    // TODO : Use Core Data instead of hardcoded String
    var appointmentsToday: [String] = ["RDV : Docteur Martin"]
    var treatmentsToday: [String] = ["Modopar 100"]
    var exercisesToday: [String] = ["Exercice : marche à pied"]
    
    var appointmentsLater: [String] = ["RDV : Docteur Dupont"]
    var treatmentsLater: [String] = ["Modopar 125"]
    var exercisesLater: [String] = ["Exercice : jardinage"]
    
    var tableViewTodoTodayCtrl: TodoTableViewController?
    var tableViewTodoLaterCtrl: TodoTableViewController?

    @IBOutlet weak var todosTableViewToday: UITableView!
    @IBOutlet weak var todosTableViewLater: UITableView!
   
    // ----------------------------------------------
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
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
