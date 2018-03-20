//
//  CoreDataDAOFactory.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

class CoreDataDAOFactory: AbstractDAOFactory {
    
    typealias PatientDAO = CDPatientDAO
    typealias PatientDAO = CDPractitionerDAO
    typealias SpecialismDAO = CDSpecialismDAO
    
    private static var instance: CoreDataDAOFactory?

    
    init() {}
    
    // Singleton pattern
    static func getInstance() -> CoreDataDAOFactory {
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }

    //MARK: DAOs
    func getPatientDAO() -> CDPatientDAO {
        return CDPatientDAO()
    }
    
    func getPractitionerDAO() -> CDPractitionerDAO {
        return CDPractitionerDAO()
    }
    
    func getSpecialismDAO() -> CDSpecialismDAO {
        return CDSpecialismDAO()
    }
}
