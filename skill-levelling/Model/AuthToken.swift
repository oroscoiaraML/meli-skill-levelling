//
//  AuthToken.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import Foundation

// MARK: - AccessToken
struct AuthToken: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let scope: String
    let userID: Int
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case scope
        case userID = "user_id"
        case refreshToken = "refresh_token"
    }
}
