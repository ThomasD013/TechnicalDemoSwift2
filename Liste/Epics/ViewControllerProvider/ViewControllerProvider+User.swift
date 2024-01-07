//
//  ViewControllerProvider+SearchFilm.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import Foundation
import UIKit
import Swinject

extension ViewControllerProvider {
    struct Consumer {
        private init() {}

        static var list: UserListViewController {
            return AppEnvironment.resolve(UserListViewController.self).orFatalError()
        }

        static func detail(user: User) -> UserDetailViewController {
            let controller: UserDetailViewController = AppEnvironment.resolve(UserDetailViewController.self).orFatalError()
            controller.viewModel.setup(user: user)
            return controller
        }
    }
}
