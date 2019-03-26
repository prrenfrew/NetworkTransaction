//
//  NetworkManagerError.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

enum NetworkManagerError: Error {
    case badRequest
    case noImageData
    case badImageData
    case networkError(Error, URLResponse?)
}
