//
//  CDDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDDAO {
    var context: NSManagedObjectContext
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }

    // =============================
    
    func save() throws {
        do {
            try context.save()
        } catch let error {
            throw error
        }

    }
}
