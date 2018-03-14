//
//  TodoTableViewCell.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 14/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//
import UIKit

class TodoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var todoTF: UILabel!
    @IBOutlet weak var hourTF: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
