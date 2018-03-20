//
//  AbstractDAOFactory.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol AbstractDAOFactory {
    associatedtype Patient
    associatedtype Practitioner
    
    // MARK: DAOs
    func getPatientDAO() -> Patient
    func getPractitionerDAO() -> Practitioner
    
}
