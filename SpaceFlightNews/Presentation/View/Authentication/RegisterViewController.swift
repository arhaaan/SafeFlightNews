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
    
    private let dependencyContainer = DependencyContainer()
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
   
   @IBAction func signInButtonTapped(_ sender: Any) {
       guard let email = usernameTextField.text else {return}
       guard let password = passwordTextField.text else {return}
       guard let confirmPassword = confirmPasswordTextField.text else {return}
       
       if password == confirmPassword {
           viewModel.register(email: email, password: password) { [weak self] result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let success):
                       print("nextPage")
                       let vc = HomeViewController()
                       let navigationController = UINavigationController(rootViewController: vc)
                       navigationController.modalPresentationStyle = .fullScreen
                       self?.present(navigationController, animated: true)
                   case .failure(let failure):
                       print(failure.localizedDescription)
                   }
               }
           }
       } else {return}
   }
   
   @IBAction func logInButtonTapped(_ sender: Any) {
       let vc = UINavigationController(rootViewController: dependencyContainer.makeLoginViewController())
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true)
   }
}
