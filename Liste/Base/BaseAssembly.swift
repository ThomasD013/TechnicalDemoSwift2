//
//  BaseAssembly.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import Foundation
import Swinject

class BaseAssembly: Assembly {
    func assemble(container: Container) {
        registerControllers(in: container)
    }

    func registerControllers(in container: Container) {}
}
