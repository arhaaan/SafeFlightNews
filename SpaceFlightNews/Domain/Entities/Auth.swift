//
//  Auth.swift
//  SpaceFlightNews
//
//  Created by Karim Arhan on 15/04/25.
//

import Foundation

struct AuthUser {
    let id: String?
    let email: String?
    let name: String?
    let accessToken: String?
}

struct AuthCredentials {
    let email: String
    let password: String
}
