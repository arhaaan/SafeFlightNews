//
//  RegisterViewController.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import UIKit

class RegisterViewController: UIViewController {

   @IBOutlet weak var usernameTextField: UITextField!
   @IBOutlet weak var passwordTextField: UITextField!
   @IBOutlet weak var confirmPasswordTextField: UITextField!
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
   @IBAction func signInButtonTapped(_ sender: Any) {
   }
   
   @IBAction func logInButtonTapped(_ sender: Any) {
      let vc = LoginViewController()
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true)
   }
}
