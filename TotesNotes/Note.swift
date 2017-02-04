//
//  Note.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/3/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    
    //MARK: - Properties
    var note: String
    fileprivate static let noteKey = "note"
    
    init(note: String) {
        self.note = note
    }
    
    //MARK: - failable initializer
    //this is taking a dict and guarding it. Then it sets the property
    convenience init?(dictionary: [String: String]) {
        guard let note = dictionary[Note.noteKey] else { return nil }
        self.init(note: note)
    }
    
    //MARK: - dictionary representation 
    var dictionaryRepresentaiton: [String: String] {
        return [Note.noteKey: note]
    }
    
}

//MARK: - conform to equitable

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.note == rhs.note
}
