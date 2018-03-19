//
//  patientDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol PatientDAO {
    func get() -> Patient?
    func create() -> Patient
    func save() throws
    func getAll() -> [Patient]?
}
