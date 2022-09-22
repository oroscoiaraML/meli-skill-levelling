//
//  RoutableApiManager.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import Foundation
import Alamofire

class RoutableApiManager: NSObject {
    static let shared = RoutableApiManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
            let userInfo = ["date": Date()]
            return CachedURLResponse(
                response: response.response,
                data: response.data,
                userInfo: userInfo,
                storagePolicy: .allowed)
        })
        let networkLogger = RoutableNetworkLogger()
        let interceptor = RoutableRequestInterceptor()
        return Session(configuration: configuration,
                       interceptor: interceptor,
                       cachedResponseHandler: responseCacher,
                       eventMonitors: [networkLogger])
    }()
}
//RequestInterceptor` used for all `Request` created by the instance. `RequestInterceptor`s can also be set on a
// per-`Request` basis, in which case the `Request`'s interceptor takes precedence over this value.

/// - Parameters:
///   - configuration:            `URLSessionConfiguration` to be used to create the underlying `URLSession`. Changes
///                               to this value after being passed to this initializer will have no effect.
///                               `URLSessionConfiguration.af.default` by default.
///
///   - interceptor:              `RequestInterceptor` to be used for all `Request`s created by this instance. `nil`
///                               by default.
///   - cachedResponseHandler:    `CachedResponseHandler` to be used by all `Request`s created by this instance.
///                               `nil` by default.
///   - eventMonitors:            Additional `EventMonitor`s used by the instance. Alamofire always adds a
///                               `AlamofireNotifications` `EventMonitor` to the array passed here. `[]` by default.
