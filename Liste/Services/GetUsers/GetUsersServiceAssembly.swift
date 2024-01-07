//
//  GetUsersServiceAssembly.swift
//  Liste
//
//  Created by Thomas on 06/01/2023.
//

import Swinject

final public class GetUsersServiceAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerGetUsersService(container: container)
    }

    private func registerGetUsersService(container: Container) {
        container.register(GetUsersServicing.self) { _ in
            if Constants.shared.isMocked {
                return GetUsersMockService()
            } else {
                return GetUsersService()
            }
        }
    }
}
