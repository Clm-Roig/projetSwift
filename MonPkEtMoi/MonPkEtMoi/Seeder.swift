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
        
        // Specialisms
        let speciaslismDAO = CoreDataDAOFactory.getInstance().getSpecialismDAO()
        let wordings = ["kinésithérapeute", "orthophoniste", "infirmer", "neurologue"]
        var specialisms = [Specialism]()
        do {
            specialisms.append(try speciaslismDAO.create())
            specialisms.append(try speciaslismDAO.create())
            specialisms.append(try speciaslismDAO.create())
            specialisms.append(try speciaslismDAO.create())
        } catch {
            print("Error creating specialisms")
        }
        
        for specialism in specialisms {
            specialism.wording = wordings[specialisms.index(of: specialism)!]
        }
        
        do {
            try speciaslismDAO.save()
        } catch {
            print("Error saving specialism seeds")
        }


    }
}
