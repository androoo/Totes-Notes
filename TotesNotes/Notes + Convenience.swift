//
//  Notes + Convenience.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/11/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(note: String, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.note = note
    }
    
}
