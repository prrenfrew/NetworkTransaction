//
//  ImageTransaction.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

public struct ImageTransaction {
    let configuration: ServiceConfiguration
    
    public init(configuration: ServiceConfiguration) {
        self.configuration = configuration
    }
    
    public func getImage(_ completionHandler: ((UIImage?, Error?) -> Void)?) {
        URLSession.shared.startTask(with: self.configuration, completionHandler)
    }
}
