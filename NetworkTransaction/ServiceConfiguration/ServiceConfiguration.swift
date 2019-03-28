//
//  ServiceConfiguration.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

public protocol ServiceConfiguration {
    var baseURL: String { get }
    var scheme: HTTPProtocol { get }
    var endpoint: String? { get }
    var method: HTTPVerb { get }
    var parameters: [String: String]? { get }
    var body: Data? { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeout: TimeInterval { get }
    var headers: [String : String]? { get }
}

extension ServiceConfiguration {
    func toRequest() -> URLRequest? {
        var stringUrl = self.scheme.rawValue + self.baseURL
        if let unwrappedEndpoint = self.endpoint {
            stringUrl += unwrappedEndpoint
        }
        if let unwrappedParameters = self.parameters {
            if !unwrappedParameters.isEmpty {
                stringUrl += "?"
            }
            for (paramKey, paramValue) in unwrappedParameters {
                stringUrl += "\(paramKey)=\(paramValue)&"
            }
            stringUrl = String(stringUrl.dropLast())
        }
        guard let serviceUrl = URL(string: stringUrl) else { return nil }
        var request = URLRequest(url: serviceUrl,
                                 cachePolicy: self.cachePolicy,
                                 timeoutInterval: self.timeout)
        request.httpBody = self.body
        request.allHTTPHeaderFields = self.headers
        request.httpMethod = self.method.rawValue
        return request
    }
}
