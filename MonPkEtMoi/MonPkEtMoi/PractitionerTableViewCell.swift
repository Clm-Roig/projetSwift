//
//  PractitionerTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Clm-Roig on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class PractitionerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameSpecialismL: UILabel!
    @IBOutlet weak var cityL: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
