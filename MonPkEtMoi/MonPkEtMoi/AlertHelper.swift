//
//  alertHelper.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper: UIAlertController {
    
    class func alertError(view: UIViewController, errorMessage: String) {
        let title = "Erreur"
        let message = errorMessage
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        view.present(alert, animated: true)
    }
    
    class func alertWarning(view: UIViewController, warningMessage: String) {
        let title = "Avertissement"
        let message = warningMessage
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        view.present(alert, animated: true)
    }
    
    class func getCurrentUIViewController() -> UIViewController {
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        if let tabBarController = rootViewController as? UITabBarController {
            rootViewController = tabBarController.selectedViewController
        }
        return rootViewController!
    }
}
