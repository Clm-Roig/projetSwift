//
//  CDPractitionerDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDPractitionerDAO: CDDAO, PractitionerDAO {
    
    func create() throws -> Practitioner {
        return Practitioner(context: self.context)
    }
    
    func delete(obj: Practitioner) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Practitioner]? {
        let request: NSFetchRequest<Practitioner> = NSFetchRequest(entityName: "Practitioner")
        do {
            let practitioners:[Practitioner] = try self.context.fetch(request)
            return practitioners
        } catch let error {
            throw error
        }

    }

}
