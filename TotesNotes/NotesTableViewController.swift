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
        
        title = "Totes Notes"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Notes", style: .plain, target: self, action: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        let entry = NoteController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.note
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetail" {
            guard let destinationViewController = segue.destination as? NoteDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationViewController.loadViewIfNeeded()
            let entry = NoteController.shared.entries[indexPath.row]
            destinationViewController.entry = entry
        }
        
    }
}


















