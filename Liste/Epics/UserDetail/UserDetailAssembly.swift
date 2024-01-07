//
//  UserDetailAssembly.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import Swinject
import SwinjectAutoregistration

final class UserDetailAssembly: BaseAssembly {

    override func registerControllers(in container: Container) {
        container.autoregister(UserDetailViewModel.self, initializer: UserDetailViewModel.init)

        container.register(UserDetailViewController.self) { resolver in
            let controller: UserDetailViewController = .init()
            let viewModel: UserDetailViewModel =  resolver.resolve(UserDetailViewModel.self)!
            controller.viewModel = viewModel
            return controller
        }
    }
}
