//
//  CDMedicineDAO.swift
//  MonPkEtMoi
//
//  Created by Matthieu Dye on 31/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDMedicineDAO: CDDAO, MedicineDAO {
    
    func create() throws -> Medicine {
        return Medicine(context: self.context)
    }
    
    func delete(obj: Medicine) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Medicine?] {
        var medicines: [Medicine] = []
        let request: NSFetchRequest<Medicine> = NSFetchRequest(entityName: "Medicine")
        do {
            medicines = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return medicines
    }
}
