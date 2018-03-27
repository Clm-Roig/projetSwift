//
//  AddTreatmentView2Controller.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 27/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddTreatmentView2Controller: UIViewController {
    let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()
    var medicines: [Medicine?] = []
    var treatmentPassed: Treatment = Treatment()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(treatmentPassed)
    }
    
    
    
}
