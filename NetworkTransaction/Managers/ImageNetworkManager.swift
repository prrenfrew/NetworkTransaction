//
//  ImageNetworkManager.swift
//  NetworkTransaction
//
//  Created by MAC on 3/26/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

extension URLSession {
    func startTask(with configuration: ServiceConfiguration, _ completionHandler: ((UIImage?, Error?) -> Void)?) {
        do {
            let request = try self.getValidRequest(configuration: configuration)
            self.dataTask(with: request) { [unowned self] (data, response, error) in
                do {
                    try self.checkNoError(error: error, with: response)
                    let validData = try self.getValidData(data: data)
                    let validImage = try self.getValidImage(data: validData)
                    completionHandler?(validImage, nil)
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
    
    private func checkNoError(error: Error?, with response: URLResponse?) throws {
        guard let unwrappedError = error else { return }
        throw NetworkManagerError.networkError(unwrappedError, response)
    }
    
    private func getValidData(data: Data?) throws -> Data {
        guard let validData = data else {
            throw NetworkManagerError.noImageData
        }
        return validData
    }
    
    private func getValidImage(data: Data) throws -> UIImage {
        guard let validImage = UIImage(data: data) else {
            throw NetworkManagerError.badImageData
        }
        return validImage
    }
}
