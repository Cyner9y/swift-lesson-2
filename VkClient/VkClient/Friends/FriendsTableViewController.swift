//
//  FriendsTableViewController.swift
//  VkClient
//
//  Created by Yuriy Fedorov on 12.12.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = [
        User(name: "Таня", surname: "Беркут", avatar: "Таня_Беркут"),
        User(name: "Игорь", surname: "Зарубин", avatar: "Игорь_Зарубин"),
        User(name: "Мария", surname: "Каневская", avatar: "Мария_Каневская"),
        User(name: "Илья", surname: "Чёрный", avatar: "Илья_Чёрный"),
        User(name: "Кэтрин", surname: "Романова", avatar: "Кэтрин_Романова"),
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let controller = segue.destination as? PhotosCollectionController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        
        controller.avatar = friends[indexPath.row].avatar
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
                as? FriendCell
        else { return UITableViewCell() }
        
        cell.friendName.text = "\(friends[indexPath.row].name) \(friends[indexPath.row].surname)"
        cell.friendAvatar.image = UIImage(named: friends[indexPath.row].avatar)
        cell.friendAvatar.layer.cornerRadius = cell.friendAvatar.frame.height / 2
        cell.friendAvatar.clipsToBounds = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}