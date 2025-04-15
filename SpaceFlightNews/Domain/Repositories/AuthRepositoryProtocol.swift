//
//  AuthRepositoryProtocol.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import Foundation

protocol AuthRepositoryProtocol {
   func login(credentials: AuthCredentials, completion: @escaping (Result<AuthUser, Error>) -> Void)
   func signUp(credentials: AuthCredentials, completion: @escaping (Result<AuthUser, Error>) -> Void)
   func logout(completion: @escaping (Result<Void, Error>) -> Void)
}
