//
//  ExerciseDoneTableViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class ExerciseDoneTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    var exercisesDone : [ExerciseDone?] = []
    var tableView : UITableView
    
    init(tableView: UITableView, exercisesDone: [ExerciseDone?]) {
        self.exercisesDone = exercisesDone
        self.tableView = tableView
        super.init()
    }
    
    //MARK: TableView DataSource/Delegate functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercisesDone.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "exerciseDoneCell", for: indexPath) as! ExerciseDoneTableViewCell
        let exerciseDone = self.exercisesDone[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let date: NSDate = exerciseDone!.date!
        let day = dateFormatter.string(from: date as Date)

        cell.dateL.text = day
        cell.activityL.text = exerciseDone?.concerns?.wording
        let duration = Int((exerciseDone?.duration)!)
        cell.durationL.text = String(duration) + " min"
        
        return cell
        
    }
}
