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
    
    /// Initialize the content of a new Treatment Notification with the name of the medicine and his quantity.
    /// The identifier of the notifcation is the objectID.
    ///
    /// - Parameter treatment: <#treatment description#>
    init(treatment: Treatment) {
        super.init()
        content.title = "Prise de médicament"
        content.body = (treatment.need?.wording!)! + " : " + treatment.quantity!
        self.identifier = treatment.objectID.uriRepresentation().absoluteString
    }
    
}
