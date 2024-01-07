//
//  UILabel+Extension.swift
//  Liste
//
//  Created by Thomas Dutartre on 07/01/2024.
//

import UIKit

extension UILabel {
    func underline(underlineString: String? = nil) {
        guard let text else { return }

        let attributedString = NSMutableAttributedString(string: text)
        var range = NSRange(location: 0, length: attributedString.length)
        if let underlineString {
            range = (text as NSString).range(of: underlineString)
        }
        attributedString.addAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
                NSAttributedString.Key.underlineColor: UIColor.systemBlue,
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ],
            range: range
        )
        attributedText = attributedString
    }
}
