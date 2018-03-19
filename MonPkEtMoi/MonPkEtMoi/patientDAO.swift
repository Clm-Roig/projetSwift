//
//  patientDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol PatientDAO {
    func get() throws -> Patient?
    func create() throws -> Patient
    func delete() throws -> Int
    func save() throws
    func getAll() throws -> [Patient]?
}
