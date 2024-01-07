//
//  ViewController.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import UIKit

open class ViewController<T: ViewModelling>: UIViewController {
    private var _viewModel: T!
    open var viewModel: T {
        get {
            guard let viewModel = _viewModel else { fatalError("accessed before initializing") }
            return viewModel
        }
        set {
            _viewModel = newValue
        }
    }
}
