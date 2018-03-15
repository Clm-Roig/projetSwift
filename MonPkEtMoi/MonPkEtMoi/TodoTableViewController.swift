//
//  TodoTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 15/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TodoTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // TODO : use [Object] instead of [String]
    var appointments: [String]
    var treatments: [String]
    var exercises: [String]
    var todosList: [String] = []
    
    var todosTableView: UITableView
    
    init(todosTableView: UITableView, treatments: [String], exercises: [String], apppointments: [String]) {
        self.todosTableView = todosTableView
        self.appointments = apppointments
        self.treatments = treatments
        self.exercises = exercises
        super.init()
        
        // TODO : Process the data --> format "Todo"
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
        let cell = self.todosTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        cell.todoTF.text = self.todosList[indexPath.row]
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
