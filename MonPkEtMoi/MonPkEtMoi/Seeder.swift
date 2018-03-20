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
        var practitioner1 = Practitioner()
        do {
            practitioner1 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner1")
        }
        practitioner1.firstName = "Michel"
        practitioner1.lastName = "Dupond"
        
        var practitioner2 = Practitioner()
        do {
            practitioner2 = try practitionerDAO.create()
        } catch {
            print("error creating practitioner2")
        }
        practitioner2.firstName = "Marie"
        practitioner2.lastName = "Monroe"
        do {
            try practitionerDAO.save()
        } catch {
            print("Error saving practitioner seeds")
        }
        
        // Specilisms
        let speciaslismDAO = CoreDataDAOFactory.getInstance().getSpecialismDAO()
        let wordings = ["kinésithérapeute", "orthophoniste", "infirmer"]
        var specialisms = [Specialism]()
        do {
            specialisms.append(try speciaslismDAO.create())
            specialisms.append(try speciaslismDAO.create())
            specialisms.append(try speciaslismDAO.create())
        } catch {
            print("Error creating specialisms")
        }
        
        for specialism in specialisms {
            specialism.wording = wordings[find(specialisms, specialism)]
        }
        
        do {
            try speciaslismDAO.save()
        } catch {
            print("Error saving specialism seeds")
        }


    }
}
