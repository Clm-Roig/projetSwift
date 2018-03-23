//
//  ProgramTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class ProgramTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityL: UILabel!
    @IBOutlet weak var durationL: UILabel!
    @IBOutlet weak var frequencyL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
