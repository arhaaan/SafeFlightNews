//
//  AuthViewModel.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import Foundation

class AuthViewModel {
   private let authRepository: AuthRepositoryProtocol
   
   @Published var authUser: AuthUser?
   
   init(authRepository: AuthRepositoryProtocol) {
      self.authRepository = authRepository
   }
   
   func login(email: String, password: String, completion: @escaping(Result<AuthUser, Error>) -> Void) {
      authRepository.login(credentials: AuthCredentials(email: email, password: password)) {
         [weak self] result in
         DispatchQueue.main.async {
            switch result {
            case .success(let result):
               print(result)
               self?.authUser = result
               completion(.success(result))
            case .failure(let error):
               print(error.localizedDescription)
               completion(.failure(error))
            }
         }
      }
   }
    
    func register(email: String, password: String, completion: @escaping(Result<AuthUser, Error>) -> Void) {
        authRepository.signUp(credentials: AuthCredentials(email: email, password: password)) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(result)
                    self?.authUser = success
                    completion(.success(success))
                case .failure(let failure):
                    print(failure.localizedDescription)
                    completion(.failure(failure))
                }
            }
        }
    }
}
