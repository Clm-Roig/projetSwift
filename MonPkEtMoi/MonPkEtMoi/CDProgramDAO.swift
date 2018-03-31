//
//  CDProgramDAO.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 01/04/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDProgramDAO: CDDAO, ProgramDAO {
    
    func create() throws -> Program {
        return Program(context: self.context)
    }
    
    func delete(obj: Program) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Program?] {
        let request: NSFetchRequest<Program> = NSFetchRequest(entityName: "Program")
        var programs: [Program] = []
        do {
            programs = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return programs
    }
    
}
