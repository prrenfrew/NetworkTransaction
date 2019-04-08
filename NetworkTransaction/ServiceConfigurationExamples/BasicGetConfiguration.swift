//
//  BasicGetConfiguration.swift
//  NetworkTransaction
//
//  Created by MAC on 4/8/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

public struct BasicGetConfiguration: ServiceConfiguration {
    private let url: String
    private let parameterCachePolicy: URLRequest.CachePolicy
    private let parameterTimeout: TimeInterval
    
    public init(url: String,
                cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
                timeout: TimeInterval = 30) {
        self.url = url
        self.parameterTimeout = timeout
        self.parameterCachePolicy = cachePolicy
    }
    
    public var baseURL: String {
        return self.url
    }
    
    public var scheme: HTTPProtocol? {
        return .https
    }
    
    public var endpoint: String? {
        return nil
    }
    
    public var method: HTTPVerb {
        return .get
    }
    
    public var parameters: [URLQueryItem]? {
        return nil
    }
    
    public var body: Data? {
        return nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        return self.parameterCachePolicy
    }
    
    public var timeout: TimeInterval {
        return self.parameterTimeout
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
