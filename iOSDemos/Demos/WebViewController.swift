//
//  WebViewController.swift
//  iOSDemos
//
//  Created by Doug Diego on 4/12/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//
// Make sure you add the following to your Info.plist:
// <key>NSAppTransportSecurity</key>
// <dict>
// <key>NSAllowsArbitraryLoads</key>
// <true/>
// </dict>

import UIKit
import WebKit

class WebViewController: UIViewController {

    lazy var wkWebView: WKWebView = {
        let config = WKWebViewConfiguration()
        let controller = WKUserContentController()
        config.userContentController = controller

        let wkWebView = WKWebView(frame: self.view.bounds, configuration: config)
        wkWebView.backgroundColor = .white
        wkWebView.navigationDelegate = self
        wkWebView.allowsBackForwardNavigationGestures = true
        wkWebView.enableAutoLayout()

        return wkWebView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(wkWebView)
        self.wkWebView.constraintToEdges(superview: self.view)
        loadUrl("http://www.diego.org")
    }

    func loadUrl(_ urlString: String) {
        NSLog("loadUrl: \(urlString)")
        if let url = URL(string: urlString) {
            wkWebView.load(URLRequest(url: url))

        } else {
            NSLog("Invalid URL: \(urlString)")
        }
    }
}

extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("didFinishNavigation")
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        NSLog("decidePolicyFor")
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("didFail error: \(error)")
    }
}
