//
//  CoreDateConnection.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 16/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import CoreData
import UIKit
import Foundation

class CoreDataConnection: NSObject {
    
    
    func getContext() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error getting app delegate.")
        }
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
}
