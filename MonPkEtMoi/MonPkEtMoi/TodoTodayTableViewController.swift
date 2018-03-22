//
//  TodoTodayTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 15/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TodoTodayTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // TODO : use [Object] instead of [String]
    var appointments: [Appointment?] = []
    var treatments: [Treatment?] = []
    var programs: [Program?] = []
    var todosList: [Any?] = []
    
    var todosTableView: UITableView
    
    init(todosTableView: UITableView, treatments: [Treatment?], programs: [Program?], apppointments: [Appointment?]) {
        self.todosTableView = todosTableView
        self.appointments = apppointments
        self.treatments = treatments
        self.programs = programs
        super.init()
        
        if(self.appointments.count > 0) {
            for app in self.appointments {
                self.todosList.append(app)
            }
        }
        if(self.treatments.count > 0) {
            for treat in self.treatments {
                self.todosList.append(treat)
            }
        }
        if(self.programs.count > 0) {
            for prog in self.programs {
                self.todosList.append(prog)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.todosTableView.dequeueReusableCell(withIdentifier: "todoTodayCell", for: indexPath) as! TodoTodayTableViewCell
        let todo = self.todosList[indexPath.row]
        
        // Appointment
        if(todo is Appointment) {
            let todoApp: Appointment = todo as! Appointment
            cell.todoL.text = "RDV : Docteur " + (todoApp.proposedBy?.lastName)!

            let hour = Calendar.current.component(.hour, from: todoApp.date! as Date)
            let minute = Calendar.current.component(.minute, from: todoApp.date! as Date)
            cell.hourL.text = String(hour) + "h" + String(minute)
        }
        
        // Progam
        // 1 reminder just for tomorrow
        if(todo is Program) {
            let todoProg: Program = todo as! Program
            cell.todoL.text = "Exercice : " + (todoProg.isComposedBy?.wording)!
            cell.hourL.text = String(todoProg.duration) + " min"
        }
        return cell
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
