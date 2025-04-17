//
//  DependencyContainer.swift
//  SpaceFlightNews
//
//  Created by SGO-ARHAN on 16/04/25.
//

import Foundation

class DependencyContainer {
    func makeAuth0Service() -> Auth0Service {
        return Auth0Service()
    }
    
    func makeAuthDataSource() -> AuthRepositoryProtocol {
        return AuthDataSource(auth0Service: makeAuth0Service())
    }
    
    func makeAuthViewModel() -> AuthViewModel {
        return AuthViewModel(authRepository: makeAuthDataSource())
    }
    
    func makeLoginViewController() -> LoginViewController {
        return LoginViewController(viewModel: makeAuthViewModel())
    }
    
    func makeRegisterViewController() -> RegisterViewController {
        return RegisterViewController(viewModel: makeAuthViewModel())
    }
}
