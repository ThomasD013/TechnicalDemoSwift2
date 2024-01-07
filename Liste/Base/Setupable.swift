//
//  Setupable.swift
//  Liste
//
//  Created by Thomas on 05/01/2023.
//

import Foundation

public protocol Setupable {
    associatedtype SetupModel

    func setup(with model: SetupModel)
}
