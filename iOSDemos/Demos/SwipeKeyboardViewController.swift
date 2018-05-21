//
//  SwipeKeyboardViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/16/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class SwipeKeyboardViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.keyboardDismissMode = .interactive
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func setupInterface() {
        self.view.addSubview(self.tableView)

        tableView.register(TextFieldTableViewCell.self,
                           forCellReuseIdentifier: "TextFieldTableViewCell")
    }

    func setupConstraints() {
        self.tableView.constraintToEdges(superview: self.view)
    }

    func textFieldCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell",
                                                 for: indexPath) as! TextFieldTableViewCell
        cell.textField.placeholder = "Enter text here"
        cell.selectionStyle = .none
        return cell
    }

}

// MARK: - UITableViewDelegate
extension SwipeKeyboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension SwipeKeyboardViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return textFieldCell(indexPath)
    }
}
