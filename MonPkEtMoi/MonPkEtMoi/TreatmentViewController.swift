//
//  TreatmentViewController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 22/02/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var medicineLabel: [String] = ["Sinemet LP 100","Modopar 150","Mantadix 100","Mantadix 100","Mantadix 100","Mantadix 100"]
    var quantityLabel: [String] = ["2 cuillères à soupe","2 pillules","1 pillule","2 pillules","2 pillules","2 pillules"]
    var hoursLabel: [String] = ["10h ; 18h","12h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h","10h ; 14h ; 18h"]

    @IBOutlet weak var treatmentsList: UITableView!
    @IBAction func addTreatment(_ sender: Any) {
        
    }
    
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
        cell.medicineLabel.text = self.medicineLabel[indexPath.row]
        cell.quantityLabel.text = self.quantityLabel[indexPath.row]
        cell.hoursLabel.text = self.hoursLabel[indexPath.row]
        return cell
    }
    
    
    //MARK: TableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicineLabel.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
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
