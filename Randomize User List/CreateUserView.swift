//
//  CreateUserView.swift
//  Randomize User List
//
//  Created by Juliana Nielson on 7/14/23.
//

import UIKit

class CreateUserView: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "Add User Unwind" else { return }

        guard let userName = userNameTextField.text, userName.isNotEmpty() else { return }
        user = User(name: userName)
    }
}
