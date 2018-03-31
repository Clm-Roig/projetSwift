//
//  TreatmentNotification.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 30/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications

class TreatmentNotification: Notification {
    
    // Static actions and categories registered by Notification.swift in the App Delegate
    static let medicationTakenAction = UNNotificationAction(identifier: Notification.medicationIntakeTakenName,
    title: "Médicament pris", options: [])
    static let medicationReportAction = UNNotificationAction(identifier: Notification.medicationIntakeReportedName,
                                                             title: "Reporter de 5min", options: [])
    static let medicationIntakeCategory = UNNotificationCategory(identifier: Notification.medicationIntakeCategoryName,
                                          actions: [medicationTakenAction,medicationReportAction],
                                          intentIdentifiers: [], options: [])
    
    /// Initialize the content of a new Treatment Notification with the name of the medicine and his quantity.
    /// The identifier of the notifcation is the objectID.
    ///
    /// - Parameter treatment: <#treatment description#>
    init(treatment: Treatment) {
        super.init()
        content.title = "Prise de médicament"
        content.body = (treatment.need?.wording!)! + " : " + treatment.quantity!
        content.categoryIdentifier = Notification.medicationIntakeCategoryName
        self.identifier = treatment.objectID.uriRepresentation().absoluteString
    }
    
    
    
}
