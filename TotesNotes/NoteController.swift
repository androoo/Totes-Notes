//
//  NoteController.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/3/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation

class NoteController {
    
    //MARK: - Properties 
    //singleton to give access to all these object answers
    //empty array of notes initialized 
    //some key i think 
    
    static let shared = NoteController()
    var notesArray = [Note]()
    fileprivate static let myNotesKey = "notes"
    
    //MARK: - initialize object with load func
    init() {
        loadFromPersistentStorage()
    }
    
    
    //MARK: - CRUD
    
    //add func
    func add(note: Note) {
        notesArray.append(note)
        saveToPersistentStorage()
    }
    
    //remove func
    func remove(note: Note) {
        guard let index = notesArray.index(of: note) else { return }
        notesArray.remove(at: index)
        saveToPersistentStorage()
    }
    
    
    //MARK: - Persistence
    
    //save func
    func saveToPersistentStorage() {
        let userDefaults = UserDefaults.standard
        let notesDictionary = notesArray.map { $0.dictionaryRepresentaiton }
        userDefaults.set(notesDictionary, forKey: NoteController.myNotesKey)
    }
    
    //load func
    func loadFromPersistentStorage() {
        //persistent storage instance
        let userDefaults = UserDefaults.standard
        //create dict prop by looking in user defaults objects with a key as types
        guard let notesDictionary = userDefaults.object(forKey: NoteController.myNotesKey) as? [[String: String]] else { return }
        // set notes array to the flatmapped dictionary
        notesArray = notesDictionary.flatMap { Note(dictionary: $0) }
    }
    
    
}
