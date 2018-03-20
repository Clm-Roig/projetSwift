//
//  AbstractDAOFactory.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol AbstractDAOFactory {
    associatedtype PatientDAO
    associatedtype PractitionerDAO
    associatedtype SpecialismDAO
    
    // MARK: DAOs
    func getPatientDAO() -> PatientDAO
    func getPractitionerDAO() -> PractitionerDAO
    func getSpecialismDAO() -> SpecialismDAO
    
}
