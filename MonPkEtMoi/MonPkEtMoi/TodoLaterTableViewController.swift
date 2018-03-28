//
//  TodoLaterTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 15/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TodoLaterTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
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
                self.todosList.insert(prog, at:0)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.todosTableView.dequeueReusableCell(withIdentifier: "todoLaterCell", for: indexPath) as! TodoLaterTableViewCell
        let todo = self.todosList[indexPath.row]
        
        // Appointment
        if(todo is Appointment) {
            let todoApp: Appointment = todo as! Appointment
            cell.todoL.text = "RDV : Docteur " + (todoApp.proposedBy?.lastName)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "fr_FR")
            let date: NSDate = todoApp.date!
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let day = dateFormatter.string(from: date as Date)
            
            dateFormatter.dateFormat = "mm"
            let minute = dateFormatter.string(from: date as Date)
            
            dateFormatter.dateFormat = "HH"
            let hour = dateFormatter.string(from: date as Date)
            
            cell.dateL.text = day + " " + String(hour) + "h" + String(minute)
        }
        
        // Progam
        // 1 reminder just for tomorrow
        if(todo is Program) {
            let todoProg: Program = todo as! Program
            cell.todoL.text = "Exercice : " + (todoProg.isComposedBy?.wording)!
            cell.todoL.text = cell.todoL.text! + " - " + String(todoProg.duration) + " min"
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "fr_FR")
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            let day = dateFormatter.string(from: date)
            cell.dateL.text = day
        }
        
        // Treatment
        if(todo is Treatment) {
            let todoTreat: Treatment = todo as! Treatment
            cell.todoL.text = (todoTreat.need?.wording)! + " : " + todoTreat.quantity!
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "fr_FR")
            
            // Day = tomorrow
            let date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let day = dateFormatter.string(from: date as Date)
            
            // Hour = hours[0]
            dateFormatter.dateFormat = "mm"
            let minute = dateFormatter.string(from: todoTreat.hours![0] as Date)
            
            dateFormatter.dateFormat = "HH"
            let hour = dateFormatter.string(from: todoTreat.hours![0] as Date)
            
            cell.dateL.text = day + " " + String(hour) + "h" + String(minute)
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
