//
//  NetworkError.swift
//  Liste
//
//  Created by Thomas Dutartre on 02/01/2024.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case mockNotFound
    case requestConstructionError
    case missingRequiredFields(String)
    case invalidParameters(operation: String, parameters: [Any])
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case requestEntityTooLarge
    case unprocessableEntity
    case http(httpResponse: HTTPURLResponse, data: Data)
    case invalidResponse(Data)
    case deleteOperationFailed(String)
    case network(URLError)
    case unknown(Error?)
}
