//
//  DispatchGroupViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/20/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import UIKit

class DispatchGroupViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        button.enableAutoLayout()
        button.setTitleColor(.black, for: .normal)
        return button
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
        self.view.backgroundColor = .white
        self.view.addSubview(self.button)
    }

    func setupConstraints() {
        self.button.widthAnchor.constraint(equalToConstant: 100).activate()
        self.button.heightAnchor.constraint(equalToConstant: 44).activate()
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
        self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
    }

    @objc func buttonPressed(_ sender: Any?) {
        makeNetworkRequests { (str) in
            NSLog("all: \(str!)")
        }
    }

    func makeNetworkRequests(completion: @escaping (_ result: String?) -> Void) {
        let group = DispatchGroup()
        var strings = "start"

        group.enter()
        makeNetworkRequest(duration: 2) { (str) in
            NSLog("Request #1 \(str ?? "nil"))\n")
            if let str = str {
                strings = strings + str
            }
            group.leave()
        }

        group.enter()
        makeNetworkRequest(duration: 3) { (str) in
            NSLog("Request #2 \(str ?? "nil"))\n")
            if let str = str {
                strings = strings + str
            }
            group.leave()
        }

        group.enter()
        makeNetworkRequest(duration: 10) { (str) in
            NSLog("Request #3 \(str ?? "nil"))\n")
            if let str = str {
                strings = strings + str
            }
            group.leave()
        }

        group.notify(queue: DispatchQueue.global(qos: .background)) {
            NSLog("All 3 network reqeusts completed")
            completion(strings)
        }
    }

    func makeNetworkRequest(duration:Int, completion: @escaping (_ result: String?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://httpbin.org/range/1024?duration=\(Int(duration))")!
        NSLog("makeNetworkRequest() \(url)")
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                NSLog(error!.localizedDescription)
                completion(nil)
            } else {
                if let str = String(data: data!, encoding: String.Encoding.utf8) {
                    completion(str)
                } else {
                    completion(nil)
                }

            }
        }
        task.resume()
    }
}
