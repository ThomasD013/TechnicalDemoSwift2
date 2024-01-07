//
//  Optional+Extension.swift
//  Liste
//
//  Created by Thomas on 04/01/2023.
//

import UIKit

extension Optional where Wrapped: UIViewController {
    func orFatalError() -> Wrapped {
        guard let viewController = self else {
            fatalError("The screen of type (\(type(of: self))) couldn't be provided")
        }
        return viewController
    }
}
