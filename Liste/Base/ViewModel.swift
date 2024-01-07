//
//  ViewModel.swift
//  Liste
//
//  Created by Thomas on 06/01/2023.
//

import Foundation

public protocol ViewModelling {}

open class ViewModel<Inputs>: ViewModelling {
    public let inputs: Inputs

    public init(inputs: Inputs) {
        self.inputs = inputs
    }
}
