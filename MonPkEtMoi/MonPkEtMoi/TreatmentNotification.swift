//
//  TreatmentNotification.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 30/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications


/// Notification of a medication intake related to a treatment.
/// Identifier (daily notification) : treatment.objectID.uriRepresentation().absoluteString
/// Identifier (reported intake) : "MedicationIntakeDelayed " + UUID().uuidString
class TreatmentNotification: Notification {
    
    // Static actions and categories registered by Notification.swift in the App Delegate
    static let medicationTakenAction = UNNotificationAction(identifier: Notification.medicationIntakeTakenName,
    title: "Médicament pris", options: [])
    static let medicationReportAction = UNNotificationAction(identifier: Notification.medicationIntakeReportedName,
    title: "Reporter de 5min", options: [])
    static let medicationIntakeCategory = UNNotificationCategory(identifier: Notification.medicationIntakeCategoryName,
                                          actions: [medicationTakenAction,medicationReportAction],
                                          intentIdentifiers: [], options: [])
    static let delayBetweenTakes = 5
    
    /// Initialize the content of a new Treatment Notification with the name of the medicine and his quantity.
    /// The identifier of the notifcation is the objectID.
    ///
    /// - Parameter treatment: the treatment related to the notification
    /// - data: dictionary with the key "delay"
    init(treatment: Treatment, data: Dictionary<String, Any>) {
        super.init()
        content.title = "Prise de médicament"
        content.body = (treatment.need?.wording!)! + " : " + treatment.quantity!
        content.userInfo = data
        content.categoryIdentifier = Notification.medicationIntakeCategoryName
        self.identifier = treatment.objectID.uriRepresentation().absoluteString
    }
    
    /// Initialize the content of a new Treatment Notification delayed.
    /// The identifier of the notifcation is the objectID.
    ///
    /// - Parameter treatment: the treatment related to the notification
    /// - data: dictionary with the key "delay"
    init(body: String, data: Dictionary<String, Any>) {
        super.init()
        content.title = "Prise de médicament"
        content.body = body
        content.userInfo = data
        content.categoryIdentifier = Notification.medicationIntakeCategoryName
        self.identifier = "MedicationIntakeDelayed " + UUID().uuidString
    }
    
    
    /// Delete all the pending notifications with the treatment identifier.
    /// Doesn't remove "delayed" medication intake notification.
    /// - Parameter treatment:
    class func deleteNotifications(treatment:Treatment) {
        center.removePendingNotificationRequests(withIdentifiers: [treatment.objectID.uriRepresentation().absoluteString])
    }
    
}
