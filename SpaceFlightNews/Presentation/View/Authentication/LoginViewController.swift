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
   
   private let viewModel: AuthViewModel
   
   init(viewModel: AuthViewModel) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   @IBAction func loginButtonTapped(_ sender: Any) {
      if userNameTextField.text != "" && passwordTextField.text != "" {
         
         viewModel.login(email: userNameTextField.text!, password: passwordTextField.text!) { [weak self] result in
            DispatchQueue.main.async {
               switch result {
               case .success(let success):
                  print("nextPage")
                  let vc = HomeViewController()
                  let navigationController = UINavigationController(rootViewController: vc)
                  navigationController.modalPresentationStyle = .fullScreen
                  self?.present(navigationController, animated: true)
               case .failure(let failure):
                  print("failed")
               }
            }
         }
         
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
