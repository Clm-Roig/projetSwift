//
//  TreatmentHourTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 27/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class TreatmentHourTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hourL: UILabel!
    @IBOutlet weak var minuteL: UILabel!
    
    @IBAction func hoursStepperPressed(_ sender: UIStepper) {
        
    }
    
    @IBAction func minutesStepperPressed(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
