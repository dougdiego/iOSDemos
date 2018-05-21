//
//  AutoLayoutCenterMultiplierViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/22/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class AutoLayoutCenterMultiplierViewController: UIViewController {

    lazy var myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .red
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()

    var centerConstraint: NSLayoutConstraint?
    var multiplier: CGFloat = 0.10
    let increment: CGFloat = 0.10

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupInterface() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.myView)
        let regcognizer = UITapGestureRecognizer(target: self, action: #selector(myViewTouched(_:)))
        myView.addGestureRecognizer(regcognizer)
    }

    func setupConstraints() {

        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        centerConstraint = NSLayoutConstraint(item: myView, attribute: .centerX, relatedBy: .equal,
                                              toItem: self.view, attribute: .centerX,
                                              multiplier: multiplier, constant: 0)
        centerConstraint?.isActive = true
    }



    @objc func myViewTouched(_ sender: Any?) {
        var multiplier = centerConstraint?.multiplier ?? 0
        multiplier += increment
        if multiplier >= 2 {
            multiplier = increment
        }

        view.removeConstraint(centerConstraint!)
        centerConstraint = NSLayoutConstraint(item: myView, attribute: .centerX, relatedBy: .equal,
                                              toItem: self.view, attribute: .centerX,
                                              multiplier: multiplier, constant: 0)
        centerConstraint?.isActive = true
    }
}
