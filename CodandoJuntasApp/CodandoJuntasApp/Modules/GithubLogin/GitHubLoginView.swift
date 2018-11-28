//
//  GitHubLoginView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 26/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
 self.register(GitHubLoginView.self) { resolver in
 GitHubLoginView()
 }
 */

protocol GitHubLoginViewDelegate: class {
    
}

class GitHubLoginView: UIViewController {
    
    var viewModel: GitHubLoginViewModel!
    var webView: WKWebView!
    var url:String = "https://github.com/login/oauth/authorize?client_id=0abb9f2986cacfb6de8f&redirect_uri=https://codandojuntasapp.firebaseapp.com/__/auth/handler"
    
    @IBOutlet weak var webContainerView: UIView!
    
    weak var delegate: GitHubLoginViewDelegate?
    
    let repository: SignInRepository
    let accessCodeSubject: PublishSubject<String> = PublishSubject()
    
    init(repository: SignInRepository) {
        self.repository = repository
        super.init(nibName: String(describing: GitHubLoginView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension GitHubLoginView {
    
    func setupViewModel() {
        self.viewModel = GitHubLoginViewModel(
            accessToken: self.accessCodeSubject.asDriver(onErrorJustReturn: ""),
            repository: self.repository
        )
    }
    
    func configureViews() {
        
        webView = WKWebView(frame: webContainerView.frame)
        webContainerView.addSubview(webView)
        webView.prepareForConstraints()
        webView.pinEdgesToSuperview()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    func setupBindings() {
        viewModel.user.drive(onNext: { (user) in
            print(user)
        }).disposed(by: rx.disposeBag)
    }
}

extension GitHubLoginView: WKNavigationDelegate, WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url?.absoluteString, url.contains("/auth/handler"){
            
            if let code = self.viewModel.match(for: "(?<=code=).+?(?=$)", in: url){
                self.accessCodeSubject.onNext(code)
            }
        }
        
        //(?<=code=).+?(?=$)
        decisionHandler(.allow)
    }
    
    
}
