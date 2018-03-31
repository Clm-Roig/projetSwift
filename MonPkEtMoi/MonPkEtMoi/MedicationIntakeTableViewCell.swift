//
//  MedicationIntakeTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class MedicationIntakeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var medicineWordingL: UILabel!
    @IBOutlet weak var treatmentHourL: UILabel!
    @IBOutlet weak var delayL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected
    }
}

