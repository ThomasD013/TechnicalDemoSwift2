//
//  GetUsersService.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import Foundation

public protocol GetUsersServicing {
    func call(with parameters: GetUsersServiceParameters) async throws -> Welcome
}

final class GetUsersService: GetUsersServicing {
    func call(with parameters: GetUsersServiceParameters) async throws -> Welcome {
        do {
            return try await Networking.shared.fetch(type: Welcome.self, route: parameters)
        } catch {
            throw error
        }
    }
}

final class GetUsersMockService: GetUsersServicing {
    func call(with parameters: GetUsersServiceParameters) async throws -> Welcome {
        if let item = try Parser.loadMock(fileName: "GetUsersMock", type: Welcome.self) {
            return item
        }
        throw NetworkError.mockNotFound
    }
}

final class GetUsersErrorService: GetUsersServicing {
    func call(with parameters: GetUsersServiceParameters) async throws -> Welcome {
        throw NetworkError.notFound
    }
}

public struct GetUsersServiceParameters {
    public let amount: Int
}

extension GetUsersServiceParameters: Routing {
    public var queryStringParameters: [String: Any]? {
        return [
            "results": amount
        ]
    }
}
