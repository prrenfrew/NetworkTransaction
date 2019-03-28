//
//  APITransaction.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

public struct APITransaction<T: Decodable> {
    let configuration: ServiceConfiguration
    
    public init(configuration: ServiceConfiguration) {
        self.configuration = configuration
    }
    
    public func startService(_ completionHandler: ((T?, Error?) -> Void)?) {
        URLSession.shared.startTask(with: self.configuration, completionHandler)
    }
}
