//
//  CDMedicationIntakeDAO.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDMedicationIntakeDAO: CDDAO, MedicationIntakeDAO {
    
    func create() throws -> MedicationIntake {
        return MedicationIntake(context: self.context)
    }
    
    func delete(obj: MedicationIntake) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [MedicationIntake?] {
        var medicationIntakes: [MedicationIntake] = []
        let request: NSFetchRequest<MedicationIntake> = NSFetchRequest(entityName: "MedicationIntake")
        do {
            medicationIntakes = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return medicationIntakes
    }
}
