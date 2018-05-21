//
//  ColoredBarButtonsViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 4/12/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class ColoredBarButtonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarButtons()
        self.view.backgroundColor = .white
    }

    func addNavBarButtons() {
        // Image from: https://icons8.com/icon/52146/settings
        let button1 = UIBarButtonItem(image: UIImage(named: "settings"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(button1Pressed(_:)))

        var image = UIImage(named: "settings")
        image = image?.withRenderingMode(.alwaysOriginal)
        let button2 = UIBarButtonItem(image: image,
                                      style: .plain,
                                      target: self,
                                      action: #selector(button2Pressed(_:)))

        self.navigationItem.rightBarButtonItems = [button1, button2]

    }

    @objc func button1Pressed(_ button: UIBarButtonItem) {
        NSLog("You pressed buttton1")
    }

    @objc func button2Pressed(_ button: UIBarButtonItem) {
        NSLog("You pressed button2")
    }

}
