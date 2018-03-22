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
    var exercises: [Exercise?] = []
    var todosList: [Any?] = []
    
    var todosTableView: UITableView
    
    init(todosTableView: UITableView, treatments: [Treatment?], exercises: [Exercise?], apppointments: [Appointment?]) {
        self.todosTableView = todosTableView
        self.appointments = apppointments
        self.treatments = treatments
        self.exercises = exercises
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
        if(self.exercises.count > 0) {
            for ex in self.exercises {
                self.todosList.append(ex)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.todosTableView.dequeueReusableCell(withIdentifier: "todoTodayCell", for: indexPath) as! TodoTodayTableViewCell
        let todo = self.todosList[indexPath.row]
        
        if(todo is Appointment) {
            let todoApp: Appointment = todo as! Appointment
            cell.todoL.text = "RDV : Docteur " + (todoApp.proposedBy?.lastName)!

            let hour = Calendar.current.component(.hour, from: todoApp.date! as Date)
            let minute = Calendar.current.component(.minute, from: todoApp.date! as Date)
            cell.hourL.text = String(hour) + "h" + String(minute)
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
