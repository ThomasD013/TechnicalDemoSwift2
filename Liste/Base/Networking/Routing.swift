//
//  Routing.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
}

public protocol Routing {
    var baseURLString: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryStringParameters: [String: Any]? { get }
}

extension Routing {
    public var baseURLString: String {
        return Constants.shared.baseURL
    }

    public var headers: [String: String] {
        return [:]
    }

    public var method: HTTPMethod {
        return .GET
    }

    public var queryStringParameters: [String: Any]? {
        return nil
    }

    public var url: URL? {
        let url = URL(string: baseURLString)
        if let queryParameters = queryStringParameters {
            guard var urlComponents = URLComponents(string: Constants.shared.baseURL) else { return nil }
            urlComponents.queryItems = queryParameters.map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
            return urlComponents.url
        }
        return url
    }
}
