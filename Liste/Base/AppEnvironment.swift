//
//  AppEnvironment.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import Swinject

struct AppEnvironment {
    static let shared = AppEnvironment()

    private(set) var assembler: Assembler
    private(set) var container: Container

    private init() {
        container = Container()
        assembler = Assembler(container: container)
    }

    public static func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return AppEnvironment.shared.assembler.resolver.resolve(serviceType)
    }

    func register() {
        container.removeAll()
        registerServices()
        registerControllers()
    }

    private func registerServices() {
        assembler.apply(assembly: GetUsersServiceAssembly())
    }

    private func registerControllers() {
        assembler.apply(assembly: UserListAssembly())
        assembler.apply(assembly: UserDetailAssembly())
    }
}
