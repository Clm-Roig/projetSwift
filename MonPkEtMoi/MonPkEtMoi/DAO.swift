//
//  DAO.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation

protocol DAO {
    associatedtype Object
    
    func create() throws -> Object
    func delete(obj: Object)
    func getAll() throws -> [Object?]
}
