//
//  Networking.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import Foundation

class Networking {
    static let shared = Networking()

    public func fetch<T: Decodable>(type: T.Type, route: Routing) async throws -> T {
        guard let url: URL = route.url else {
            throw NetworkError.requestConstructionError
        }

        var request: URLRequest = .init(url: url)
        request.allHTTPHeaderFields = route.headers
        request.httpMethod = route.method.rawValue

        let rawResponse: (Data, URLResponse) = try await URLSession.shared.data(for: request)
        let result: T = try JSONDecoder().decode(type, from: try buildResponse(response: rawResponse))
        return result
    }

    private func buildResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }

        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 402:
            throw NetworkError.paymentRequired
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 413:
            throw NetworkError.requestEntityTooLarge
        case 422:
            throw NetworkError.unprocessableEntity
        default:
            throw NetworkError.http(httpResponse: httpResponse, data: response.data)
        }
    }
}
