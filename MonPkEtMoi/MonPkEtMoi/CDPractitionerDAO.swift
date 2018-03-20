//
//  CDPractitionerDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

class CDPractitionerDAO: PractitionerDAO {
    
    func create() throws -> Practitioner {
        return Practitioner()
    }
    
    func delete() throws -> Int {
        return 3
    }
    
    func save() throws {
        
    }
    
    func getAll() throws -> [Practitioner]? {
        return [Practitioner()]
    }

}
