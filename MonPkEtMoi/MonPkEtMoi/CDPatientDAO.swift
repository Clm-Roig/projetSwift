//
//  CDPatientDAO.swift
//  MonPkEtMoi
//
//  Created by Clément Roig on 17/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDPatientDAO: CDDAO, PatientDAO {
    
    func create() throws -> Patient {
        return Patient(context: self.context)
    }
    
    func delete(obj: Patient) {
        // TODO
    }
    
    func getAll() throws -> [Patient]? {
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: "Patient")
        do {
            let patients:[Patient] = try self.context.fetch(request)
            return patients
        } catch let error {
            throw error
        }
    }
    
    // MARK: custom methods
    func get() throws -> Patient? {
        do {
            guard let patients: [Patient] = try self.getAll() else {
                print("Error getting patient")
                return nil
            }
            return patients.first
        } catch let error {
            throw error
        }
    }

}
