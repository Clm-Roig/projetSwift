//
//  ExerciseDoneTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Matthieu Dye on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class ExerciseDoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var activityL: UILabel!
    @IBOutlet weak var durationL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
