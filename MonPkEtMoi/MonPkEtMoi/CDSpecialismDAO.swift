//
//  CDSpecialismDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDSpecialismDAO: CDDAO, SpecialismDAO {
    func create() throws -> Specialism {
        return Specialism(context: self.context)
    }
    
    func delete(obj: Specialism) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Specialism?] {
        let request: NSFetchRequest<Specialism> = NSFetchRequest(entityName: "Specialism")
        var specialisms: [Specialism] = []
        do {
            specialisms = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return specialisms
    }

}
