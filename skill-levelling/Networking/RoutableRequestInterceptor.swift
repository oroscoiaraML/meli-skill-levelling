//
//  RoutableRequestInterceptor.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit
import Alamofire

//
//Session creates and manages Alamofire’s Request types during their lifetimes. It also provides common functionality for all Requests, including queuing, interception, trust management, redirect handling, and response cache handling.
//
class RoutableRequestInterceptor: RequestInterceptor {
    let retryLimit = 3
    let retryDelay: TimeInterval = 10
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if let token = UserDefaults.standard.object(forKey: "token") {
            let bearerToken = "Bearer \(token)"
            print("Bearer token \(bearerToken)")
            urlRequest.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
    }

}
