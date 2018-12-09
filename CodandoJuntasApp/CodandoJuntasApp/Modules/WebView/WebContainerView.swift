//
//  webContainerView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 03/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
/*
 Code for dependency injection:
    self.register(webContainerView.self) { resolver in
        webContainerView()
    }
 */

protocol WebContainerViewDelegate: class {
    func closeWebView()
}

class WebContainerView: WebViewController {
    
    @IBOutlet weak var webContentView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var closeViewButton: UIButton!
    
    var viewModel: webContainerViewModel!
    
    weak var delegate: WebContainerViewDelegate?

    init() {
        super.init(nibName: String(describing: WebContainerView.self), bundle: nil)
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

extension WebContainerView {
    
    func setupViewModel() {
        self.viewModel = webContainerViewModel()
    }
    
    func configureViews() {
        
        headerView.addShadow(offSetX: 0, offSetY: 3, radius: 2, opacity: 0.4)
        
        webContentView.addSubview(webView)
        webView.prepareForConstraints()
        webView.pinEdgesToSuperview()
        
        webContentView.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.width.equalTo(webContentView)
            make.top.left.right.equalTo(webContentView)
        }
        
       // titleLabel.text = headerTitle.uppercased()
    }
    
    func setupBindings() {
        
        closeViewButton.rx.tap.bind{ [weak self] _ in
            self?.delegate?.closeWebView()
        }.disposed(by: rx.disposeBag)

    }
    
    func loadUrl(_ url: String) {
         webView.load(URLRequest(url: URL(string: url)!))
    }
}
