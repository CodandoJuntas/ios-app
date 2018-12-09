//
//  webviewController.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 03/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import WebKit


protocol webViewNavigationDelegate: class {
    func verifyURl(_ url: String)
}

class WebViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {
    
    var progressView = UIProgressView(progressViewStyle: .bar)
    var ctrlTittle = true
    var webViewDelegate: webViewNavigationDelegate!
    var localStorage: LocalStorage? = nil
    
    var webView: WKWebView! {
        didSet {
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    var url:String = ""
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView(frame: view.frame, configuration: self.config())
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let urlString = navigationAction.request.url?.absoluteString, navigationAction.navigationType == .linkActivated {
           // self.webViewDelegate.verifyURl(urlString)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.alpha = 1
            let animated = Float(webView.estimatedProgress) > progressView.progress;
            progressView.setProgress(Float(webView.estimatedProgress), animated: animated)
            if Float(webView.estimatedProgress) >= 1.0 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finished: Bool) in
                    self.progressView .setProgress(0, animated: false)
                })
            }
        } else {
            
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    func config()->WKWebViewConfiguration {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let config = WKWebViewConfiguration()
        config.preferences = preferences
        return config
    }
}
