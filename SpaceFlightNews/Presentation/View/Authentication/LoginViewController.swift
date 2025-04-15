//
//  LoginViewController.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import UIKit

class LoginViewController: UIViewController {

   @IBOutlet weak var userNameTextField: UITextField!
   @IBOutlet weak var passwordTextField: UITextField!
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   @IBAction func loginButtonTapped(_ sender: Any) {
      if userNameTextField.text != "" && passwordTextField.text != "" {
         print("nextPage")
         let vc = HomeViewController()
         let navigationController = UINavigationController(rootViewController: vc)
         navigationController.modalPresentationStyle = .fullScreen
         self.present(navigationController, animated: true)
      } else {
         print("failed")
      }
   }
   
   @IBAction func signUpButtonTapped(_ sender: Any) {
      let vc = RegisterViewController()
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true)
   }
}
