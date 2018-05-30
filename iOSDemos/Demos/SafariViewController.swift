//
//  SafariViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 5/30/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open",
                                                                 style: .done, target: self, action: #selector(openButtonTouched(_:)))
    }

    @objc func openButtonTouched(_ sender: Any?) {
        if let url = URL(string: "https://www.google.com") {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
            safariVC.delegate = self
        }
    }
}
extension SafariViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
