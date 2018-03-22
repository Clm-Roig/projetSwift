//
//  TodoLaterTableViewCell
//  MonPkEtMoi
//
//  Created by Clement ROIG on 14/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//
import UIKit

class TodoLaterTableViewCell: UITableViewCell {

    @IBOutlet weak var todoL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
