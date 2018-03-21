//
//  CDAppointmentDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDAppointmentDAO: CDDAO, AppointmentDAO {
    func create() throws -> Appointment {
        return Appointment(context: self.context)
    }
    
    func delete(obj: Appointment) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Appointment]? {
        let request: NSFetchRequest<Appointment> = NSFetchRequest(entityName: "Appointment")
        do {
            let appointments:[Appointment] = try self.context.fetch(request)
            return appointments
        } catch let error {
            throw error
        }
    }

}
