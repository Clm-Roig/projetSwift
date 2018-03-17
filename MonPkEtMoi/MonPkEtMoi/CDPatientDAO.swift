//
//  CDPatientDAO.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 17/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CDPatientDAO {
    
    var context: NSManagedObjectContext
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }
    
    func getById(id: Int) -> Patient {
        let patient = Patient()
        return patient
    }
    
    func delete(id: Int) -> Int {
        return 3
    }
    
    func create(object: Patient) -> Bool {
        return true
    }
    
    func update(object: Patient) -> Bool {
        return true
    }
    
    func getAll() -> [Patient] {
        return []
    }
}
