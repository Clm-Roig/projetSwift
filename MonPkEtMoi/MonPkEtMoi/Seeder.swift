//
//  Seeder.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 20/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

class Seeder {
    func seed() {
        // Practitioner
        let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()
        let specialismDAO = CoreDataDAOFactory.getInstance().getSpecialismDAO()
        
        var practitioner1 = Practitioner()
        do {
            practitioner1 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner1")
        }
        practitioner1.firstName = "Michel"
        practitioner1.lastName = "Dupond"
        practitioner1.city = "Montpellier"
        
        var spe1 = Specialism()
        do {
            spe1 = try specialismDAO.create()
        } catch {
            print("error creating specialism 1")
        }
        spe1.setValue("neurologue", forKey: "wording")
        practitioner1.setValue(spe1, forKey: "master")
        
        var practitioner2 = Practitioner()
        do {
            practitioner2 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner2")
        }
        practitioner2.firstName = "Marie"
        practitioner2.lastName = "Monroe"
        practitioner2.city = "Castelnau Le Lez"
        
        var spe2 = Specialism()
        do {
            spe2 = try specialismDAO.create()
        } catch {
            print("error creating specialism 2")
        }
        spe2.setValue("kinésithérapeute", forKey: "wording")
        practitioner2.setValue(spe2, forKey: "master")
        do {
            try practitionerDAO.save()
        } catch {
            print("Error saving practitioner seeds")
        }
        
        // Appointments
        let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()
        var appointment1 = Appointment()
        do {
            appointment1 = try appointmentDAO.create()
        } catch {
            print("error creating appointment 1")
        }
        appointment1.date = Date() as NSDate
        appointment1.proposedBy = practitioner1
        
        var appointment2 = Appointment()
        do {
            appointment2 = try appointmentDAO.create()
        } catch {
            print("error creating appointment 2")
        }
        appointment2.date = Calendar.current.date(byAdding: .day, value: 1, to: Date())! as NSDate
        appointment2.proposedBy = practitioner2
        
        do {
            try appointmentDAO.save()
        } catch {
            print("Error saving practitioner seeds")
        }
        
        // Exercises
        let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()
        var program1 = Program()
        do {
            program1 = try exerciseDAO.createProgram()
        } catch {
            print("error creating program 1")
        }
        program1.frequency = 2
        program1.duration = 30
        
        var exercise1 = Exercise()
        do {
            exercise1 = try exerciseDAO.create()
        } catch {
            print("error creating exercise 1")
        }
        exercise1.wording = "Marche"
        exercise1.composes = program1
        
        do {
            try exerciseDAO.save()
        } catch {
            print("Error saving exercises seeds")
        }

    }
}
