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
    
    func presentEmptyNameAlert() {
        let title = "Please Enter a User Name"
        let message = "All users require a name."
        let alert = UIAlertController(title: title, message: message,
           preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
        alert.addAction(action)
    
        present(alert, animated: true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        guard let userName = userNameTextField.text, userName.isNotEmpty() else {
            presentEmptyNameAlert()
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "Add User Unwind" else { return }

        guard let userName = userNameTextField.text, userName.isNotEmpty() else { return }
        user = User(name: userName)
    }
}
