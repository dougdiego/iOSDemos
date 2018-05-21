//
//  UIView+AutoLayout.swift
//  ProgrammaticAutolayout
//
//  Created by Doug Diego on 2/4/17.
//  Copyright © 2017 Doug Diego. All rights reserved.
//

import UIKit

extension UIView {
    func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func fixToTopEdges(of view: UIView) {
        view.enableAutoLayout()
        view.topAnchor.constraint(equalTo: view.topAnchor).activate()
        view.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        view.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
    }

    func constraintToEdges(superview: UIView) {
        constraintToEdges(superview: superview, constant: 0)
    }

    func constraintToEdges(superview: UIView, constant: CGFloat) {
        guard let mySuperView = self.superview else { fatalError("No superview") }
        guard mySuperView.isEqual(superview) else { fatalError("Wrong superview") }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).activate()
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).activate()
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).activate()
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant).activate()
    }

    func constraintToLayoutMarginsGuide(superview: UIView) {
        self.leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor).activate()
        self.trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor).activate()
        self.bottomAnchor.constraint(equalTo: superview.layoutMarginsGuide.bottomAnchor).activate()
        self.topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor).activate()
    }
}
