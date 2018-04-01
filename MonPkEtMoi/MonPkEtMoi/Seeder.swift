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
        
        //MARK: Specialisms
        let specialismDAO = CoreDataDAOFactory.getInstance().getSpecialismDAO()
        let specialisms = ["kinésithérapeute","infirmier","orthophoniste", "psychologue clinicien","neuropsychologue","médecine généraliste","psychiatre","neurochirurgien"]
        
        for spe in specialisms {
            var newSpe = Specialism()
            do {
                newSpe = try specialismDAO.create()
                newSpe.wording = spe
            } catch {
                print("error creating specialism")
            }
        }
        do {
            try specialismDAO.save()
        } catch {
            print("Error saving specialisms seeds")
        }
        
        
        //MARK: Practitioner
        let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()
        
        var spe:[Specialism] = []
        do {
            spe = try specialismDAO.getAll() as! [Specialism]
        } catch {
            print("error getting all specialisms")
        }

        var practitioner1 = Practitioner()
        do {
            practitioner1 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner1")
        }
        practitioner1.firstName = "Michel"
        practitioner1.lastName = "Dupond"
        practitioner1.city = "Montpellier"
        practitioner1.master = spe[0]
        
        var practitioner2 = Practitioner()
        do {
            practitioner2 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner2")
        }
        practitioner2.firstName = "Marie"
        practitioner2.lastName = "Monroe"
        practitioner2.city = "Castelnau Le Lez"
        practitioner2.master = spe[1]
        
        var practitioner3 = Practitioner()
        do {
            practitioner3 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner3")
        }
        practitioner3.firstName = "Olivier"
        practitioner3.lastName = "Lambert"
        practitioner3.city = "Montpellier"
        practitioner3.master = spe[1]
        
        do {
            try practitionerDAO.save()
        } catch {
            print("Error saving practitioner seeds")
        }
        
        //MARK: Appointments
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
        appointment2.date = Calendar.current.date(byAdding: .day, value: 4, to: Date())! as NSDate
        appointment2.proposedBy = practitioner2
        
        do {
            try appointmentDAO.save()
        } catch {
            print("Error saving practitioner seeds")
        }
        
        //MARK: Programs
        let programDAO = CoreDataDAOFactory.getInstance().getProgramDAO()
        var program1 = Program()
        do {
            program1 = try programDAO.create()
        } catch {
            print("error creating program 1")
        }
        program1.frequency = 2
        program1.duration = 30
        
        let exerciseDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()

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
        
        //MARK: Medicine
        let medicineDAO = CoreDataDAOFactory.getInstance().getMedicineDAO()
        var medicines: [Medicine?] = []
        let medicinesWording = ["Modopar 62,5","Modopar 125","Modopar 250","Modopar LP 125", "Modopar dispersible 125", "Sinemet 100", "Sinemet 250", "Sinemet LP 100","Sinemet LP 200", "Stalevo 50"]
        
        for med in medicinesWording {
            var newMed = Medicine()
            do {
                newMed = try medicineDAO.create()
                newMed.wording = med
            } catch {
                print("error creating medicine")
            }
            medicines.append(newMed)
        }
        do {
            try medicineDAO.save()
        } catch {
            print("Error saving medicines seeds")
        }
        
        //MARK: Treatments
        let treatmentDAO = CoreDataDAOFactory.getInstance().getTreatmentDAO()

        var treatment1 = Treatment()
        do {
            treatment1 = try treatmentDAO.create()
        } catch {
            print("error creating treatment1")
        }
        treatment1.quantity = "2 pilules"
        treatment1.need = medicines[0]
        treatment1.hour = Calendar.current.date(byAdding: .hour, value: 3, to: Date())! as NSDate
        treatment1.endingDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())! as NSDate
        do {
            try treatmentDAO.save()
        } catch {
            print("Error saving treatments seeds")
        }
        
        //MARK: Medication Intake
        let medicationIntakeDAO = CoreDataDAOFactory.getInstance().getMedicationIntakeDAO()
        
        var medicationIntake: MedicationIntake?
        do {
            medicationIntake = try medicationIntakeDAO.create()
        } catch let error {
            print("Erreur à la création de la prise de médicament.")
            print(error)
        }
        guard let newMedicationIntake = medicationIntake else {
            return
        }
        medicationIntake = newMedicationIntake
        medicationIntake?.date = Date() as NSDate
        medicationIntake?.delay = -1
        medicationIntake?.wording = "Agent Chimique X (pas pris ou +1h)"
        
        var medicationIntake2: MedicationIntake?
        do {
            medicationIntake2 = try medicationIntakeDAO.create()
        } catch let error {
            print("Erreur à la création de la prise de médicament.")
            print(error)
        }
        guard let newMedicationIntake2 = medicationIntake2 else {
            return
        }
        medicationIntake2 = newMedicationIntake2
        medicationIntake2?.date = Calendar.current.date(byAdding: .day, value: -8, to: Date())! as NSDate
        medicationIntake2?.delay = 5
        medicationIntake2?.wording = "Médicament pris à temps (-30min)"
        
        var medicationIntake3: MedicationIntake?
        do {
            medicationIntake3 = try medicationIntakeDAO.create()
        } catch let error {
            print("Erreur à la création de la prise de médicament.")
            print(error)
        }
        guard let newMedicationIntake3 = medicationIntake3 else {
            return
        }
        medicationIntake3 = newMedicationIntake3
        medicationIntake3?.date = Calendar.current.date(byAdding: .day, value: -3, to: Date())! as NSDate
        medicationIntake3?.delay = 35
        medicationIntake3?.wording = "Médicament retard (+ 30-60min)"
        
        do {
            try medicationIntakeDAO.save()
        } catch let error {
            print("Erreur à la sauvegarde de la prise de médicament")
            print(error)
        }

    }
}
