//
//  TreatmentNotification.swift
//  MonPkEtMoi
//
//  Created by Thais Aurard on 30/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications

class TreatmentNotification {
    let center = UNUserNotificationCenter.current()
    var request: UNNotificationRequest?
    let content: UNMutableNotificationContent
    let identifier: String
    
    init(timeInterval: TimeInterval, repeats: Bool, title: String, body: String) {
        content = UNMutableNotificationContent()

        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        self.identifier = UUID().uuidString
    }
    
    /// Set the trigger of the request according to a DateComponents.
    ///
    /// - Parameter dateComponents: <#dateComponent description#>
    func setDateTrigger(dateComponents: DateComponents, repeats:Bool) {
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repeats)
        self.request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        self.addNotificationToCenter()
    }
    
    
    /// Set the trigger of the request according to a TimeInterval and add it to the center.
    ///
    /// - Parameters:
    ///   - timeInterval: <#timeInterval description#>
    ///   - repeats: <#repeats description#>
    func setTimeIntervalTrigger(timeInterval: TimeInterval, repeats: Bool) {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        self.request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        self.addNotificationToCenter()
    }
    
    
    /// Schedule a notification in the notification center.
    /// The notification trigger must be correctly set.
    ///
    /// - Parameter notificationRequest: <#notificationRequest description#>
    private func addNotificationToCenter() {
        center.add(request!, withCompletionHandler: {
            (error) in
            if let error = error {
                print("Error with the notification scheduling.")
                print(error)
            }
        })
    }
    
    
}
