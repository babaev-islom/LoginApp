//
//  LoginModel.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import Foundation

struct LoginModel: Codable {
    let accessToken, csrf: String?
    let user: User?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case csrf, user
        case error
    }
}

struct User: Codable {
    let id, firstName, lastName, email: String
    let lastSeenAt: String?
    let projectID: String
    let prototypeOwner: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case lastSeenAt = "last_seen_at"
        case projectID = "project_id"
        case prototypeOwner = "prototype_owner"
    }
}
