//
//  patientDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol PatientDAO: DAO {
    associatedtype Object = Patient
    
    /// Get the first patient in DB.
    ///
    /// - Returns: Patient?, the first patient in DB or nil
    /// - Throws: DB error
    func get() throws -> Patient?
}
