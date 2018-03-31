//
//  NotificationDelegate.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
            
        case Notification.medicationIntakeTakenName:
            print("Taken")
            let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()
            
            // Retrieve the delay of the medication intake and insert the medication intake
            if let delay = response.notification.request.content.userInfo["delay"] as? String {
                var medicationIntake: MedicationIntake?
                do {
                    medicationIntake = try medicationIntakeDAO.create()
                } catch let error {
                    print("Erreur à la création de la prise de médicament.")
                    print(error)
                }
                
                guard let newMedicationIntake = medicationIntake else {
                    return
                }
                medicationIntake = newMedicationIntake
                medicationIntake?.date = Date() as NSDate
                medicationIntake?.delay = Int16(delay)!
                
                // insert in DB
                do {
                    try medicationIntakeDAO.save()
                } catch let error {
                    print("Erreur à la sauvegarde de la prise de médicament")
                    print(error)
                }
            }

        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
