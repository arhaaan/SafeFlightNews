//
//  AuthDataSource.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import Foundation

class AuthDataSource: AuthRepositoryProtocol {
   
   private let auth0Service : Auth0Service
   
   init(auth0Service: Auth0Service) {
      self.auth0Service = auth0Service
   }
   
   func login(credentials: AuthCredentials, completion: @escaping (Result<AuthUser, any Error>) -> Void) {
      auth0Service.login(
         email: credentials.email,
         password: credentials.password,
         completion: completion
      )
   }
   
   func signUp(credentials: AuthCredentials, completion: @escaping (Result<AuthUser, any Error>) -> Void) {
      auth0Service.signUp(
         email: credentials.email,
         password: credentials.password,
         completion: completion
      )
   }
   
   func logout(completion: @escaping (Result<Void, any Error>) -> Void) {
      auth0Service.logout(completion: completion)
   }

}
