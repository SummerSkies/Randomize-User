//
//  UserListTable.swift
//  Randomize User List
//
//  Created by Juliana Nielson on 7/14/23.
//

// Your task is to create a simple randomizing table view app(UIKit). The app needs to have the ability to enter any amount of users. After users have been entered be able to randomly select one user.
// The user only needs a name. A list of all users should display in a table view. It is up to you on how to get a random user from the group.

import UIKit

class UserListTable: UITableViewController {
    
    var userList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func selectRandomUser() -> User? {
        return userList.randomElement()
    }
    
    @IBAction func selectRandomUserButtonPressed(_ sender: Any) {
        guard let randomUser = selectRandomUser() else { return }
        print("Selected user: \(randomUser.name).")
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userList.isNotEmpty() {
            return userList.count
        } else {
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard userList.isNotEmpty() else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Default Cell", for: indexPath)

            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "User Cell", for: indexPath)

        let user = userList[indexPath.row]
        cell.textLabel?.text = user.name

        return cell
    }
    
    //Add User
    
    @IBAction func addUserButtonTapped(_ sender: Any) {
        print("+ tapped")
        userList.append(User(name: "Annarylis"))
        tableView.reloadData()
    }
}
