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
    typealias PractitionerDAO = CDPractitionerDAO
    typealias SpecialismDAO = CDSpecialismDAO
    typealias TreatmentDAO = CDTreatmentDAO
    
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
    
    func getAppointmentDAO() -> CDAppointmentDAO {
        return CDAppointmentDAO()
    }
    
    func getExerciseDAO() -> CDExerciseDAO {
        return CDExerciseDAO()
    }
    
    func getTreatmentDAO() -> CDTreatmentDAO {
        return CDTreatmentDAO()
    }
}
