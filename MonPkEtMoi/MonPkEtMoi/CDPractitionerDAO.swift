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
    
    func delete(obj: Practitioner) throws -> Int {
        // TODO
        return 3
    }
    
    func getAll() throws -> [Practitioner]? {
        return [Practitioner()]
    }

}
