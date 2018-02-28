//
//  TreatmentViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var treatments: [String] = ["toto","tat"]

    @IBOutlet weak var treatmentsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.treatmentsList.dequeueReusableCell(withIdentifier: "treatmentCell", for: indexPath) as! TreatmentTableViewCell
        cell.medicineLabel.text = self.treatments[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.treatments.count
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
