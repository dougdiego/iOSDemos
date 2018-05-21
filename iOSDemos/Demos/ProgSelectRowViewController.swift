//
//  ProgSelectRowViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/17/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class ProgSelectRowViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
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

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select Rows",
                                                                 style: .done, target: self, action: #selector(toggleButtonTouched(_:)))
    }

    func setupConstraints() {
        self.tableView.constraintToEdges(superview: self.view)
    }

    func tableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "tableViewCell")
        cell.textLabel?.text = "Section: \(indexPath.section) Row \(indexPath.row)"
        return cell
    }

    @objc func toggleButtonTouched(_ sender: Any?) {
        selectRows()
    }

    func selectRows() {
        NSLog("selectRows()")
        for i in 0..<10 {
            if i % 2 == 0 {
                NSLog("Select row: \(i)")
                let indexPath = IndexPath(row: i, section: 0)
                self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                self.tableView.delegate?.tableView!(self.tableView, didSelectRowAt: indexPath)
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension ProgSelectRowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        NSLog("didSelectRowAt() indexPath: \(indexPath)")
    }
}

// MARK: - UITableViewDataSource
extension ProgSelectRowViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewCell(indexPath)
    }
}

