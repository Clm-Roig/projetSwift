//
//  CDTreatmentDAO.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 23/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDTreatmentDAO: CDDAO, TreatmentDAO {
    
    func create() throws -> Treatment {
        return Treatment(context: self.context)
    }
    
    func delete(obj: Treatment) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Treatment?] {
        var treatments: [Treatment] = []
        let request: NSFetchRequest<Treatment> = NSFetchRequest(entityName: "Treatment")
        do {
            treatments = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return treatments
    }
}
