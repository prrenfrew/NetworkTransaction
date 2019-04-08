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
    var scheme: HTTPProtocol? { get }
    var endpoint: String? { get }
    var method: HTTPVerb { get }
    var parameters: [URLQueryItem]? { get }
    var body: Data? { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeout: TimeInterval { get }
    var headers: [String : String]? { get }
}

extension ServiceConfiguration {
    func toRequest() -> URLRequest? {
        var stringUrl = ""
        if let schemeValue = self.scheme?.rawValue {
            stringUrl += schemeValue + "://"
        }
        stringUrl += self.baseURL
        if let unwrappedEndpoint = self.endpoint {
            stringUrl += unwrappedEndpoint
        }
        
        if var urlComponents = URLComponents(string: stringUrl), let parameters = self.parameters {
            urlComponents.queryItems = parameters
            stringUrl = urlComponents.string ?? stringUrl
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
