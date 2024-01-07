//
//  UIView+Extension.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import UIKit

extension UIView {

    public func addSubviewAndFit(_ subView: UIView, margin: CGFloat = 0) {
        addSubview(subView)
        subView.didMoveToSuperview()

        subView.anchor(top: topAnchor, topConstant: margin,
                       bottom: bottomAnchor, bottomConstant: margin,
                       leading: leadingAnchor, leadingConstant: margin,
                       trailing: trailingAnchor, trailingConstant: margin)
    }

    @discardableResult public func anchor(top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0,
                                          bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0,
                                          leading: NSLayoutXAxisAnchor? = nil, leadingConstant: CGFloat = 0,
                                          trailing: NSLayoutXAxisAnchor? = nil, trailingConstant: CGFloat = 0,
                                          width: CGFloat = 0,
                                          height: CGFloat = 0,
                                          activated: Bool = true) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
        }
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        if height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        anchors.forEach { $0.isActive = activated }
        return anchors
    }

    public func anchorCenterX(to view: UIView? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if let view = view {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            return
        } else if let superview = self.superview {
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
    }

    /// Anchors the view to a given view, if no view is given it will be anchored to its superview
    ///
    /// - Parameter view: view to anchor to, default: superview
    public func anchorCenterY(to view: UIView? = nil) {
        translatesAutoresizingMaskIntoConstraints = false

        if let view = view {
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            return
        } else if let superview = self.superview {
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        }
    }

    public func anchorCenter(to view: UIView? = nil) {
        anchorCenterX(to: view)
        anchorCenterY(to: view)
    }

    public static func spacer(height: CGFloat) -> UIView {
        let view: UIView = .init()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}
