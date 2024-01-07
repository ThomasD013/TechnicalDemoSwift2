//
//  Array+Extension.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import Foundation

public extension Array {
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
