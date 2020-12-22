//
//  FriendsTableViewController.swift
//  VkClient
//
//  Created by Yuriy Fedorov on 12.12.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
        
    var myFriends = generateUsers(count: 100)
    var firstLetters = [Character]()
    var sortedFriends = [Character: [User]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FriendsSectionHeader.self, forHeaderFooterViewReuseIdentifier: "FriendsSectionHeader")
        
        (firstLetters, sortedFriends) = sortFriends(myFriends)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? PhotosCollectionController,
            let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let char = firstLetters[indexPath.section]
        
        if let selectedFriend = sortedFriends[char]?[indexPath.row] {
            destination.avatar = selectedFriend.avatar
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        firstLetters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let charFriends = firstLetters[section]
        return sortedFriends[charFriends]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
                as? FriendCell
        else { return UITableViewCell() }
        
        let firstLetter = firstLetters[indexPath.section]
        if let friends = sortedFriends[firstLetter] {
            cell.friendName.text = "\(friends[indexPath.row].firstName) \(friends[indexPath.row].lastName)"
            cell.friendAvatar.image = UIImage(named: "Avatars/\(friends[indexPath.row].avatar)")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendsSectionHeader")
                as? FriendsSectionHeader
        else { return nil }
        sectionHeader.backgroundView?.backgroundColor = tableView.backgroundColor
        sectionHeader.backgroundView?.alpha = 0.5
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(firstLetters[section])
    }
}
