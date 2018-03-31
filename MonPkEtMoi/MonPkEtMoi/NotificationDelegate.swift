//
//  NotificationDelegate.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications
import CoreData

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
            
        //MARK: Medication intakes
        case Notification.medicationIntakeTakenName:
            let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()
            
            // Retrieve the data of the medication intake and insert the medication intake
            guard let delay = response.notification.request.content.userInfo["delay"] as? Int else {
                return
            }
            guard let wording = response.notification.request.content.userInfo["wording"] as? String else {
                return
            }
            
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
            medicationIntake?.delay = Int16(delay)
            medicationIntake?.wording = wording
            
            // insert in DB
            do {
                try medicationIntakeDAO.save()
            } catch let error {
                print("Erreur à la sauvegarde de la prise de médicament")
                print(error)
            }
            
            
        case Notification.medicationIntakeReportedName:
            // 1h without taking the medicine, stop the notification
            if response.notification.request.content.userInfo["delay"] as! Int >= 60 {
                let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()

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
                medicationIntake?.delay = -1
                medicationIntake?.wording = response.notification.request.content.userInfo["wording"] as? String
                
                do {
                    try medicationIntakeDAO.save()
                } catch let error {
                    print("Erreur à la sauvegarde de la prise de médicament")
                    print(error)
                }
            }
            else {
                
                // Create a new notification
                var data = Dictionary<String, Any>()
                if let delay = response.notification.request.content.userInfo["delay"] as? Int {
                    data["delay"] = delay + TreatmentNotification.delayBetweenTakes
                }
                if let wording = response.notification.request.content.userInfo["wording"] as? String {
                    data["wording"] = wording
                }
                let body: String = response.notification.request.content.body
                let notification = TreatmentNotification(body: body, data: data)
                
                let triggerDate = Calendar.current.date(byAdding: .minute, value: TreatmentNotification.delayBetweenTakes, to: Date())!
                let timeInterval = triggerDate.timeIntervalSince(Date())
                
                notification.setTimeIntervalTrigger(timeInterval: timeInterval, repeats: false)
            }
            
        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
