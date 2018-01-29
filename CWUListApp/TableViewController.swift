//
//  TableViewController.swift
//  CWUListApp
//
//  Created by William Wyatt on 1/27/18.
//  Copyright © 2018 William Wyatt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var myEmojiNames = ["Drum","Bears","Bulls"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        title = "My Emoji Names"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
        // Add an alert box
        let alert  = UIAlertController(title: "Name your new Emoji Sticker", message: nil, preferredStyle: .alert)
        
        // Create a text input field where a user can input text
        alert.addTextField { (emojiNameTF) in emojiNameTF.placeholder = "My Emoji" }
        
        // Add the user's input to the list we have
        
        // 1. Create an "add" alert button action
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let emojiName = alert.textFields?.first?.text else { return }
            // Add the emoji name to the list
            self.addItem(emojiName)
            print(emojiName)
        }
        
        // 2. Apply the button to the alert box
        alert.addAction(addAction)
        
        // Present the alert box to the user
        present(alert, animated: true)
    }
    
    func addItem(_ newEmoji: String) {
        // Insert emoji name to the top of the myEmojiStickers array
        let index = 0
        myEmojiNames.insert(newEmoji, at: index)
        
        // Insert the new rows in the tableView on the top
        let indexPath = IndexPath(row: index, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .left)
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myEmojiNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

        // Configure the cell...
        let cellText = myEmojiNames[indexPath.row]
        cell.textLabel?.text = cellText

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            myEmojiNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
