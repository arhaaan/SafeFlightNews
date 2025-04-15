//
//  Auth0Service.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import Auth0
import Foundation

class Auth0Service {
   private let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
   
   func login(email: String, password: String, completion: @escaping (Result<AuthUser, Error>) -> Void) {
      Auth0
         .authentication()
         .login(
            usernameOrEmail: email,
            password: password,
            connection: "Username-Password-Authentication",
            scope: "openid profile email"
         )
         .start { result in
            switch result {
            case .success(let credentials):
               self.credentialsManager.store(credentials: credentials) { error in
                  if let error = error {
                     completion(.failure(error))
                  } else {
                     completion(.success(self.mapToAuthUser(credentials: credentials)))
                  }
               }
            case .failure(let error):
               completion(.failure(error))
            }
         }
   }
   
   func signUp(email: String, password: String, completion: @escaping (Result<AuthUser, Error>) -> Void) {
      Auth0
         .authentication()
         .createUser(
            email: email,
            password: password,
            connection: "Username-Password-Authentication"
         )
         .start { result in
            switch result {
            case .success:
               self.login(email: email, password: password, completion: completion)
            case .failure(let error):
               completion(.failure(error))
            }
         }
   }
   
   func logout(completion: @escaping (Result<Void, Error>) -> Void) {
      do {
         try credentialsManager.clear() // Assuming clear is a synchronous method
         completion(.success(()))
      } catch {
         completion(.failure(error))
      }
   }
   
   private func mapToAuthUser(credentials: Credentials) -> AuthUser {
      let idToken = credentials.idToken
      let claims = idToken.flatMap { try? decode(jwt: $0) } ?? [:]
      
      return AuthUser(
         id: credentials.idToken,
         email: claims["email"] as? String,
         name: claims["name"] as? String,
         accessToken: credentials.accessToken
      )
   }
   
   private func decode(jwt: String) throws -> [String: Any] {
      let parts = jwt.components(separatedBy: ".")
      guard parts.count == 3 else { throw AuthError.invalidJWT }
      
      let payload = parts[1]
      let padded = payload.padding(toLength: ((payload.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
      guard let data = Data(base64Encoded: padded) else { throw AuthError.invalidJWT }
      
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      guard let payloadDict = json as? [String: Any] else { throw AuthError.invalidJWT }
      
      return payloadDict
   }
}

enum AuthError: Error {
    case invalidJWT
    case noCredentials
    case auth0Error(Error)
}
