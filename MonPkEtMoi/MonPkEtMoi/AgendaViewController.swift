//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController {
    
    var appointmentsToday: [String] = ["RDV : Docteur Martin"]
    var treatmentsToday: [String] = ["Modopar 100"]
    var exercisesToday: [String] = ["Exercice : marche à pied"]
    
    var tableViewTodoTodayCtrl: TodoTableViewController?
    
    @IBOutlet weak var todosTableView: UITableView!
   
    // ----------------------------------------------
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO : get todos from Core Data before passing them to Ctrl
        tableViewTodoTodayCtrl = TodoTableViewController(todosTableView: self.todosTableView, treatments: self.treatmentsToday, exercises: self.exercisesToday, apppointments: self.appointmentsToday)
    }
    
    override internal func didReceiveMemoryWarning() {
        
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        
    }
    
}
