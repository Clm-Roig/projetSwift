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
import UIKit

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    /// If the app is in the foreground and a notification appears, shows it.
    ///
    /// - Parameters:
    ///   - center: <#center description#>
    ///   - notification: <#notification description#>
    ///   - completionHandler: <#completionHandler description#>
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Play sound and show alert to the user
        completionHandler([.alert,.sound])
    }
    
    
    /// Handle respose to a notification. 
    ///
    /// - Parameters:
    ///   - center: <#center description#>
    ///   - response: <#response description#>
    ///   - completionHandler: <#completionHandler description#>
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // Determine the user action
        switch response.actionIdentifier {
            
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
            
        // Notification tapped (open the app)
        case UNNotificationDefaultActionIdentifier:
            print("Notification tapped")

            // Determine type notification
            switch response.notification.request.content.categoryIdentifier {
            case Notification.medicationIntakeCategoryName:
                print("Medication intake notification")
                
                // Retrieve data
                guard let delay = response.notification.request.content.userInfo["delay"] as? Int else {
                    return
                }
                guard let wording = response.notification.request.content.userInfo["wording"] as? String else {
                    return
                }
                
                let message = wording
                // Display alert on the current view
                // Create the alert controller
                let alertController = UIAlertController(title: "Prise de médicament", message: message, preferredStyle: .alert)
                
                // Taken action
                let takeAction = UIAlertAction(title: "Médicament pris", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    NSLog("Taken")
                    
                    self.saveMedicationIntake(delay: delay, wording: wording)
                }
                // Reported action
                let reportAction = UIAlertAction(title: "Reporter (5min)", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    NSLog("Reported")
                    
                    // Create a new notification
                    var data = Dictionary<String, Any>()
                    data["delay"] = delay + TreatmentNotification.delayBetweenTakes
                    data["wording"] = wording
                    
                    let body: String = response.notification.request.content.body
                    let notification = TreatmentNotification(body: body, data: data)
                    
                    let triggerDate = Calendar.current.date(byAdding: .minute, value: TreatmentNotification.delayBetweenTakes, to: Date())!
                    let timeInterval = triggerDate.timeIntervalSince(Date())
                    
                    notification.setTimeIntervalTrigger(timeInterval: timeInterval, repeats: false)
                }
                // Add the actions
                alertController.addAction(takeAction)
                alertController.addAction(reportAction)
                
                // Present the controller
                AlertHelper.getCurrentUIViewController().present(alertController, animated: true)
                
                
            case Notification.appointmentCategoryName:
                print("Appointment notification")
                // Navigate to Agenda View
                
            default:
                print("Unknown notification")
            }
            
            
        //MARK: Medication intakes
        case Notification.medicationIntakeTakenName:
            // Retrieve the data of the medication intake
            guard let delay = response.notification.request.content.userInfo["delay"] as? Int else {
                return
            }
            guard let wording = response.notification.request.content.userInfo["wording"] as? String else {
                return
            }
            saveMedicationIntake(delay: delay, wording: wording)
            
        case Notification.medicationIntakeReportedName:
            guard var delay = response.notification.request.content.userInfo["delay"] as? Int else {
                return
            }
            guard let wording = response.notification.request.content.userInfo["wording"] as? String else {
                return
            }
            
            // 1h without taking the medicine, stop the notification
            if delay >= 60 {
                // Medication intake missed, the delay is set to -1
                delay = -1
                saveMedicationIntake(delay: delay, wording: wording)
                
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
    
    
    /// Save a new medication Intake taken now in the DB.
    ///
    /// - Parameters:
    ///   - delay: the delay of the intake after the original hour of intake
    ///   - wording: the name of the medicine taken
    func saveMedicationIntake(delay: Int, wording: String) {
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
        medicationIntake?.delay = Int16(delay)
        medicationIntake?.wording = wording
        
        // insert in DB
        do {
            try medicationIntakeDAO.save()
        } catch let error {
            print("Erreur à la sauvegarde de la prise de médicament")
            print(error)
        }
    }
    
}
