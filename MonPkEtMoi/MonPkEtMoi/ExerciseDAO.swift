//
//  ExerciseDAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 21/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol ExerciseDAO: DAO {
    typealias Object = Exercise
    
    
    /// Create a new Program
    ///
    /// - Returns: Program
    /// - Throws:
    func createProgram() throws -> Program
    
    /// Delete a Program
    func deleteProgram(prog: Program)
    
    
    /// Return all the programs
    ///
    /// - Returns: [Program?]
    /// - Throws:
    func getAllPrograms() throws -> [Program?]
}
