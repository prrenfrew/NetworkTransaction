//
//  NetworkManager.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

extension URLSession {
    func startTask<T: Decodable>(with configuration: ServiceConfiguration, _ completionHandler: ((T?, Error?) -> Void)?) {
        do {
            let request = try self.getValidRequest(configuration: configuration)
            self.dataTask(with: request) { [unowned self] (data, response, error) in
                do {
                    try self.checkNoError(error: error, response: response)
                    let validData = try self.getValidData(data: data)
                    let validObject: T = try self.getValidObject(data: validData)
                    completionHandler?(validObject, nil)
                } catch let parsingError {
                    completionHandler?(nil, parsingError)
                }
            }.resume()
        } catch let requestError {
            completionHandler?(nil, requestError)
        }
    }
    
    private func getValidRequest(configuration: ServiceConfiguration) throws -> URLRequest {
        guard let validRequest = configuration.toRequest() else {
            throw NetworkManagerError.badRequest
        }
        return validRequest
    }
    
    private func checkNoError(error: Error?, response: URLResponse?) throws {
        guard let unwrappedError = error else { return }
        throw NetworkManagerError.networkError(unwrappedError, response)
    }
    
    private func getValidData(data: Data?) throws -> Data {
        guard let validData = data else {
            throw NetworkManagerError.noImageData
        }
        return validData
    }
    
    private func getValidObject<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
