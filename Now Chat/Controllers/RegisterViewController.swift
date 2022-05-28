//
//  RegisterViewController.swift
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { [self]AuthResult, error in
                if let e = error {self.errorAlert(title: "Registration Error", e.localizedDescription)}
                else { self.performSegue(withIdentifier: "RegisterToChat", sender: self) }
            }
        }
    }
    
}
