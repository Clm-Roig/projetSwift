//
//  Notification.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 30/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UserNotifications

class Notification {
    static var center = UNUserNotificationCenter.current()
    var request: UNNotificationRequest?
    var content: UNMutableNotificationContent
    var identifier: String
    
    /// Initialize the notification.
    init() {
        content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default()
        identifier = ""
    }
    
    /// Schedule a notification in the notification center.
    /// The notification trigger must be correctly set.
    ///
    /// - Parameter notificationRequest: <#notificationRequest description#>
    private func addNotificationToCenter() {
        Notification.center.add(request!, withCompletionHandler: {
            (error) in
            if let error = error {
                print("Error with the notification scheduling.")
                print(error)
            }
        })
    }
    
    
    /// Delete an existing notification. 
    ///
    /// - Parameter identifier: <#identifier description#>
    static func delete(identifier: String) {
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    
    //MARK: Triggers
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
    
}
