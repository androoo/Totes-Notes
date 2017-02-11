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
    var entry: Entry? {
        didSet {
            if !isViewLoaded {
                loadView()
            }
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var noteTextView: UITextView!
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let enteredNote = noteTextView.text, !enteredNote.isEmpty else { return }
        NoteController.shared.addNewEntry(note: enteredNote)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - View Life Cycle
    
    
    //MARK: - Helper Methods
    
    func setTextViewStyle(textView: UITextView) {
        textView.textColor = .black
        
        automaticallyAdjustsScrollViewInsets = false
        textView.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 30, right: 15)
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        noteTextView.text = entry.note
    }
}




























