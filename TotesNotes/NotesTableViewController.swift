//
//  NotesTableViewController.swift
//  TotesNotes
//
//  Created by Andrew Ervin Gierke on 2/3/17.
//  Copyright © 2017 Androoo. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Color
        view.backgroundColor = viewBackgroundColor
        navigationController?.navigationBar.barTintColor = navBarColor
        navigationController?.navigationBar.tintColor = navBarTextColor
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.notesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let note = NoteController.shared.notesArray[indexPath.row]
        cell.textLabel?.text = note.note
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
