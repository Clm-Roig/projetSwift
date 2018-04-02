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
    
    func createExerciseDone() throws -> ExerciseDone
    func deleteExerciseDone(exerciseDone: ExerciseDone)
    func getAllExercisesDone() throws -> [ExerciseDone?]
    
}
