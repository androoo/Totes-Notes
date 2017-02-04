//
//  NoteDetailViewController.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/3/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    //MARK: - Properties
    var note: Note?
    
    //MARK: - Outlets
    @IBOutlet weak var noteTextView: UITextView!
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let enteredNote = noteTextView.text, !enteredNote.isEmpty else { return }
        let note = Note(note: enteredNote)
        NoteController.shared.add(note: note)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        updateViews()
    }

    
    //MARK: - Helper Methods
    func updateViews() {
        guard let note = note else { return }
        noteTextView.text = note.note
    }
}




























