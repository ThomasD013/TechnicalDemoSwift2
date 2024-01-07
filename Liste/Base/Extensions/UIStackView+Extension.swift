//
//  UIStackView+Extension.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import UIKit

extension UIStackView {
    func addArrangerSubViews(subViews: [UIView]) {
        subViews.forEach {
            addArrangedSubview($0)
        }
    }
}
