//
//  TodoTodayTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 15/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TodoTodayTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
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
        // Sort the TODOs
        self.todosList = self.todosList.sorted {
            if($0 is Treatment && $1 is Treatment) {
                let todo0 = $0 as! Treatment
                let todo1 = $1 as! Treatment
      
                // Compare just hours and minutes
                let hour0 = 60 * Calendar.current.component(.hour, from: (todo0.hours![0] as Date))
                let minutes0 = Calendar.current.component(.minute, from: (todo0.hours![0] as Date))
                
                let hour1 = 60 * Calendar.current.component(.hour, from: (todo1.hours![0] as Date))
                let minutes1 = Calendar.current.component(.minute, from: (todo1.hours![0] as Date))
                
                return (hour0 + minutes0) < (hour1 + minutes1)
            }
            if($0 is Treatment && $1 is Appointment) {
                let todo0 = $0 as! Treatment
                let todo1 = $1 as! Appointment
                
                // Compare just hours and minutes
                let hour0 = 60 * Calendar.current.component(.hour, from: (todo0.hours![0] as Date))
                let minutes0 = Calendar.current.component(.minute, from: (todo0.hours![0] as Date))
                
                let hour1 = 60 * Calendar.current.component(.hour, from: (todo1.date! as Date))
                let minutes1 = Calendar.current.component(.minute, from: (todo1.date! as Date))
                
                return (hour0 + minutes0) < (hour1 + minutes1)
            }
            if($0 is Appointment && $1 is Treatment){
                let todo0 = $0 as! Appointment
                let todo1 = $1 as! Treatment
                
                // Compare just hours and minutes
                let hour0 = 60 * Calendar.current.component(.hour, from: (todo0.date! as Date))
                let minutes0 = Calendar.current.component(.minute, from: (todo0.date! as Date))
                
                let hour1 = 60 * Calendar.current.component(.hour, from: (todo1.hours![0] as Date))
                let minutes1 = Calendar.current.component(.minute, from: (todo1.hours![0] as Date))
                
                return (hour0 + minutes0) < (hour1 + minutes1)
            }
            if($0 is Appointment && $1 is Appointment) {
                let todo0 = $0 as! Appointment
                let todo1 = $1 as! Appointment
                
                // Compare just hours and minutes
                let hour0 = 60 * Calendar.current.component(.hour, from: (todo0.date! as Date))
                let minutes0 = Calendar.current.component(.minute, from: (todo0.date! as Date))
                
                let hour1 = 60 * Calendar.current.component(.hour, from: (todo1.date! as Date))
                let minutes1 = Calendar.current.component(.minute, from: (todo1.date! as Date))
                
                return (hour0 + minutes0) < (hour1 + minutes1)
            }
            return false
        }
        
        
        // Programs are inserted at the end of the list (no hour)
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

            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "fr_FR")
            let date: NSDate = todoApp.date!
            
            dateFormatter.dateFormat = "mm"
            let minute = dateFormatter.string(from: date as Date)
            
            dateFormatter.dateFormat = "HH"
            let hour = dateFormatter.string(from: date as Date)
            
            cell.hourL.text = String(hour) + "h" + String(minute)
        }
        
        // Progam
        // 1 reminder just for tomorrow
        if(todo is Program) {
            let todoProg: Program = todo as! Program
            cell.todoL.text = "Exercice : " + (todoProg.isComposedBy?.wording)!
            cell.todoL.text = cell.todoL.text! + " - " + String(todoProg.duration) + " min"
            cell.hourL.text = ""
        }
        
        // Treatment
        if(todo is Treatment) {
            let todoTreat: Treatment = todo as! Treatment
            cell.todoL.text = (todoTreat.need?.wording)! + " : " + todoTreat.quantity!
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "fr_FR")
            let date: NSDate = todoTreat.hours![0]
            
            dateFormatter.dateFormat = "mm"
            let minute = dateFormatter.string(from: date as Date)
            
            dateFormatter.dateFormat = "HH"
            let hour = dateFormatter.string(from: date as Date)
            
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
