//
//  TodoTodayTableViewCell
//  MonPkEtMoi
//
//  Created by Matthieu Dye on 14/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//
import UIKit

class TodoTodayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoL: UILabel!
    @IBOutlet weak var hourL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
