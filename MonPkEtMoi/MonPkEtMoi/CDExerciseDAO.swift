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
    
    func getAll() throws -> [Exercise?] {
        var exercises: [Exercise] = []
        let request: NSFetchRequest<Exercise> = NSFetchRequest(entityName: "Exercise")
        do {
            exercises = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return exercises
    }
    
    // ==========================================
    // PROGRAMS
    
    func createProgram() throws -> Program {
        return Program(context: self.context)
    }
    
    func deleteProgram(prog: Program) {
        self.context.delete(prog)
    }
    
    func getAllPrograms() throws -> [Program?] {
        var programs: [Exercise] = []
        let request: NSFetchRequest<Exercise> = NSFetchRequest(entityName: "Program")
        do {
            programs = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return programs
    }
    
}
