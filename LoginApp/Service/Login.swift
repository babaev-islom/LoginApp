//
//  Login.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//


import Foundation
import Alamofire

struct LoginURLs {
    static let base = ApiURLs.base
    static let login = "sessions"
}

extension NetworkManager {
    struct Login {
        internal static func makeRequest<Model: Codable>(url: String, method: HTTPMethod = .post, params: [String: AnyHashable], headers: HTTPHeaders? = nil , complition: @escaping (DataResponse<Model, AFError>) -> Void) {

            let _url = LoginURLs.base + url

            NetworkManager.shared.makeRequest(url: _url, method: method, params: params, headers: headers, complition: complition)

        }
        
        static func login(params: [String: AnyHashable] = [:], complition: @escaping Complition<LoginModel>) {
            Login.makeRequest(url: String(format: LoginURLs.login), method: .post, params: params, complition: complition)
         }
    }
}
