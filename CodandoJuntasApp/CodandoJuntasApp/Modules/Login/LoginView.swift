//
//  LoginView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(LoginView.self) { resolver in
        LoginView()
    }
 */

protocol LoginViewDelegate: class {
    func openSignUp()
    func skipLogin()
}

class LoginView: UIViewController {
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var skipLoginButton: UIButton!
    @IBOutlet weak var githubLoginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var viewModel: LoginViewModel!
    
    weak var delegate: LoginViewDelegate?
    
    let signInRepository: SignInRepository
    let localStorage: LocalStorage

    init(repository: SignInRepository, storage:LocalStorage) {
        self.localStorage = storage
        self.signInRepository = repository
        super.init(nibName: String(describing: LoginView.self), bundle: nil)
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

extension LoginView {
    
    func setupViewModel() {
        self.viewModel = LoginViewModel(
        facebookLoginTap: self.facebookLoginButton.rx.tap.asSignal(),
        gitHubLoginTap: self.githubLoginButton.rx.tap.asSignal(),
        repository: self.signInRepository,
        storage: self.localStorage
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        
        self.skipLoginButton.rx.tap.bind { [weak self] _ in
            self?.delegate?.skipLogin()
            }.disposed(by: rx.disposeBag)
        
        self.signUpButton.rx.tap.bind { [weak self] _ in
            self?.delegate?.openSignUp()
            }.disposed(by: rx.disposeBag)

    }
}
