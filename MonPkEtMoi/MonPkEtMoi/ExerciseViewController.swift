//
//  ExerciseViewController.swift
//  MonPkEtMoi
//
//  Created by Matthieu DYE on 13/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class ExerciseViewController : UIViewController {
    let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()

    var programs: [Program?] = []
    var exercisesDone: [ExerciseDone?] = []
    
    var tableViewProgramCtrl: ProgramTableViewController?
    var tableViewExDoneCtrl: ExerciseDoneTableViewController?
    
    @IBOutlet weak var programTableView: UITableView!
    @IBOutlet weak var exerciseDoneTableView: UITableView!
    
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
    }
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadData() {
        // Get Data
        do {
            self.exercisesDone = try exerciseDAO.getAllExercisesDone()
        } catch {
            fatalError("Erreur lors de l'obtention des exercices effectués.")
        }
        do {
            self.programs = try exerciseDAO.getAllPrograms()
        } catch {
            fatalError("Erreur lors de l'obtention des programmes.")
        }
        
        // Construct table view controller
        tableViewProgramCtrl = ProgramTableViewController()
        self.programTableView.dataSource = self.tableViewProgramCtrl
        self.programTableView.delegate = self.tableViewProgramCtrl
        
        
        tableViewExDoneCtrl = ExerciseDoneTableViewController()
        self.exerciseDoneTableView.dataSource = self.ExerciseDoneTableViewController
        self.exerciseDoneTableView.delegate = self.ExerciseDoneTableViewController
    }
    
    
}
