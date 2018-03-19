//
//  alertHelper.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    
    class func alertError(view: UIViewController, errorMessage: String) {
        let title = "Erreur"
        let message = errorMessage
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        view.present(alert, animated: true)
    }
}
