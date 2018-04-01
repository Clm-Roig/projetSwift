//
//  AppointmentNotification
//  MonPkEtMoi
//
//  Created by Clément Roig on 30/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications

/// Notification of an appointment.
/// Identifier : appointment.objectID.uriRepresentation().absoluteString
class AppointmentNotification: Notification {
    
    static let appointmentCategory = UNNotificationCategory(identifier: Notification.appointmentCategoryName, actions: [], intentIdentifiers: [], options: [])
    
    /// Initialize the content of a new Meeting Notification with the name of the practitioner and the hour of the appointment.
    /// The identifier of the notifcation is the objectID.
    ///
    /// - Parameter treatment: <#treatment description#>
    init(appointment: Appointment) {
        super.init()
        // Get hour
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"fr_FR")
        dateFormatter.dateFormat = "HH'h'mm"
        let hourToPrint = dateFormatter.string(from: appointment.date! as Date)
        
        content.title = "Rendez-vous médical"
        content.body = "Vous avez rendez-vous avec M./Mme " + (appointment.proposedBy?.lastName)!
        content.body += " à " + hourToPrint + "."
        content.categoryIdentifier = Notification.appointmentCategoryName
        self.identifier = appointment.objectID.uriRepresentation().absoluteString
    }
    
    /// Delete all the pending notifications with the appointment identifier.
    /// - Parameter appointment:
    class func deleteNotifications(appointment:Appointment) {
        center.removePendingNotificationRequests(withIdentifiers: [appointment.objectID.uriRepresentation().absoluteString])
    }
    
}
