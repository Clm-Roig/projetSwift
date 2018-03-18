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
    
    func get() -> Patient?	 {
        guard let patients: [Patient] = self.getAll() else {
            print("Error getting patient")
            return nil
        }
        return patients.first
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
    
    func getAll() -> [Patient]? {
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: "Patient")
        do {
            let patients:[Patient] = try self.context.fetch(request)
            return patients
        } catch {
            print("Error getting all patients")
            return nil
        }
    }
}
