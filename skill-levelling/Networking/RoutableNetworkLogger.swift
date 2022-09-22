//
//  RoutableNetworkLogger.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import Foundation
import Alamofire


class RoutableNetworkLogger: EventMonitor {
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    
    func request<Value>(_ request: DataRequest,
                        didParseResponse response: DataResponse<Value,
                        AFError>) {
        guard let data = response.data else {
            return
        }
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        } else {
            print("json no correct format")
        }
    }
}
