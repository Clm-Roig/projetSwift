//
//  AgendaViewController.swift
//  MonPkEtMoi
//
//  Created by Matthieu DYE on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class AgendaViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoToday: [String] = ["Exercice : marche à pied", "RDV : Docteur Martin"]
    var hourToday: [String] = ["12h30","14h30"]
    
    
    @IBAction func switchChanged(_ sender: Any) {
    }
    
    @IBOutlet weak var todoListToday: UITableView!
    
    override internal func viewDidLoad() {
        
    }
    
    override internal func didReceiveMemoryWarning() {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.todoListToday.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        cell.todoTF.text = self.todoToday[indexPath.row]
        cell.hourTF.text = self.hourToday[indexPath.row]
        return cell
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
       
        return self.todoToday.count
    }
    
    
}
