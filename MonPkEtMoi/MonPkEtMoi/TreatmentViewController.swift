//
//  TreatmentViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController {
    
  
    var medicineLabel: [String] = ["Matrix"]
    var quantityLabel: [String] = ["1 pilule rouge et 1 pilule bleue"]
    var hoursLabel: [String] = ["10h ; 18h","12h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h"]
  
    var treatments: [Treatment?] = []
    
    @IBOutlet weak var treatmentsList: UITableView!
    @IBAction func addTreatment(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO : Call the DAO 
        
        let tableViewCtrl = TreatmentTableViewController(treatmentTableView: self.treatmentsList, treatments: self.treatments)
        self.treatmentsList.delegate = tableViewCtrl
        self.treatmentsList.dataSource = tableViewCtrl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
