//
//  CDExerciseDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import CoreData

class CDExerciseDAO: CDDAO, ExerciseDAO {
    
    func create() throws -> Exercise {
        return Exercise(context: self.context)
    }
    
    func delete(obj: Exercise) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Exercise]? {
        let request: NSFetchRequest<Exercise> = NSFetchRequest(entityName: "Exercise")
        do {
            let exercises:[Exercise] = try self.context.fetch(request)
            return exercises
        } catch let error {
            throw error
        }
    }
    
}
