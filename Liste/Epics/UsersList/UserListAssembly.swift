//
//  UserListAssembly.swift
//  Liste
//
//  Created by Thomas Dutartre on 05/01/2024.
//

import Swinject
import SwinjectAutoregistration

final class UserListAssembly: BaseAssembly {

    override func registerControllers(in container: Container) {
        container.autoregister(UserListViewModel.Dependencies.self, initializer: UserListViewModel.Dependencies.init)
        container.autoregister(UserListViewModel.self, initializer: UserListViewModel.init)

        container.register(UserListViewController.self) { resolver in
            let controller: UserListViewController = .init()
            let viewModel: UserListViewModel =  resolver.resolve(UserListViewModel.self)!
            controller.viewModel = viewModel
            return controller
        }
    }
}
