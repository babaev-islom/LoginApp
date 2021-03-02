//
//  NetworkManager.swift
//  LoginApp
//
//  Created by Islom on 01/03/21.
//

import Foundation
import Alamofire

internal typealias Complition<Model: Codable> = (DataResponse<Model,AFError>) -> Void
struct ApiURLs {
    static let base = "https://api-qa.mvpnow.io/v1/"
}

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    
    internal func makeRequest<Model: Codable>(url: String, method: HTTPMethod = .get, params: [String: AnyHashable], headers: HTTPHeaders? = nil, complition: @escaping Complition<Model>) {
        
        let _headers = headers //remove if additional headers are not added
        
        let request = AF.request(url, method: method, parameters: params, headers: _headers)
        request.responseDecodable(of: Model.self) { response in
            complition(response)
        }
    }
}

