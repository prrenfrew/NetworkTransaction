//
//  Enums.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

public enum HTTPProtocol: String {
    case https = "HTTPS"
    case http = "HTTP"
}

public enum HTTPVerb: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case put = "PUT"
}
