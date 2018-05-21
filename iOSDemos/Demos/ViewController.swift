//
//  ViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/16/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()
    var demos = [Demo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Demos", comment: "")
        setupInterface()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func setupInterface() {
        self.view.addSubview(self.tableView)
        self.title = "iOS Demos"
        loadDemos()
    }

    func setupConstraints() {
        self.tableView.constraintToEdges(superview: self.view)
    }

    func loadDemos() {
        if let path = Bundle.main.path(forResource: "demos", ofType: "json") {
            do {
                demos = try Demos(fromURL: URL(fileURLWithPath: path))
                self.tableView.reloadData()
            } catch  {
                NSLog("Unable to load file at path: \(path) \(error)")
            }
        }
    }

    func loadViewController(_ demo: Demo){
        let className = "iOSDemos.\(demo.viewController)"
        let aClass = NSClassFromString(className) as! UIViewController.Type
        let viewController = aClass.init()
        viewController.title = demo.title
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func demoCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "demoCell")
        let demo = demos[indexPath.row]
        cell.textLabel?.text = demo.title
        cell.detailTextLabel?.text = demo.description
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let demo = demos[indexPath.row]
        loadViewController(demo)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return demoCell(indexPath)
    }
}
