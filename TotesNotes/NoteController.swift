//
//  NoteController.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/3/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation
import CoreData

class NoteController {
    
    static let shared = NoteController()
    
    var entries: [Entry] {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        return ( try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    
    //MARK: - CRUD
    
    //add func
    func addNewEntry(note: String){
        let _ = Entry(note: note)
        saveToPersistentStorage()
    }
    
    
    //remove func
    func deleteNote(entry: Entry) {
        CoreDataStack.context.delete(entry)
        saveToPersistentStorage()
    }
    
    
    //MARK: - Persistence
    
    //save func
    func saveToPersistentStorage() {
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("There was a problem saving: \(error)")
        }
    }
}
