//
//  UIImageView.swift
//  Liste
//
//  Created by Thomas on 05/01/2023.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        DispatchQueue.global().async { [weak self] in
            if let url, let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
