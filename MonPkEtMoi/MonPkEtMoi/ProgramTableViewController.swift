//
//  ProgramTableViewController.swift
//  MonPkEtMoi
//
//  Created by Matthieu Dye on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class ProgramTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    let programDAO = CoreDataDAOFactory.getInstance().getProgramDAO()

    var programs : [Program?] = []
    var tableView : UITableView
    
    init(tableView: UITableView, programs: [Program?]) {
        self.programs = programs
        self.tableView = tableView
        super.init()
    }
    
    //MARK: TableView DataSource/Delegate functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath) as! ProgramTableViewCell
        let program = self.programs[indexPath.row]
        
        cell.activityL.text = program?.isComposedBy!.wording!
        
        let duration: Int = Int(program!.duration)
        cell.durationL.text = String(duration) + " min"
        let frequency: Int = Int(program!.frequency)
        cell.frequencyL.text = String(frequency) + " fois par jour"
        
        return cell
    } 
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            programDAO.delete(obj: programs[indexPath.row]!)
            do {
                try programDAO.save()
            } catch {
                fatalError("Erreur à la suppression du programme.")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            programs.remove(at: indexPath.row)
            tableView.endUpdates()
        }
    }

}
