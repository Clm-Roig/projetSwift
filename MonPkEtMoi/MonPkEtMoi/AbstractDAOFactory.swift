//
//  AbstractDAOFactory.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol AbstractDAOFactory {
    
    associatedtype AppointmentDAO
    associatedtype ExerciseDAO
    associatedtype MedicationIntakeDAO
    associatedtype MedicineDAO
    associatedtype PatientDAO
    associatedtype PractitionerDAO
    associatedtype ProgramDAO
    associatedtype SpecialismDAO
    associatedtype TreatmentDAO

    // MARK: DAOs
    func getAppointmentDAO() -> AppointmentDAO
    func getExerciseDAO() -> ExerciseDAO
    func getMedicationIntakeDAO() -> MedicationIntakeDAO
    func getMedicineDAO() -> MedicineDAO
    func getPatientDAO() -> PatientDAO
    func getPractitionerDAO() -> PractitionerDAO
    func getProgramDAO() -> ProgramDAO
    func getSpecialismDAO() -> SpecialismDAO
    func getTreatmentDAO() -> TreatmentDAO
    
}
