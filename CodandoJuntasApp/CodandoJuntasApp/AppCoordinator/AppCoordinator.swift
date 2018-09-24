//
//  AppCoordinator.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
    lazy var storage: LocalStorage = {
        container.resolve(LocalStorage.self)!
    }()
    
    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        
        showMainView()
        if storage.firstAccess {
            showOnBoarding()
        } else {
            showMainView()
        }
    }
    
    fileprivate func showMainView() {
        let view = container.resolve(FeedView.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showOnBoarding() {
        let view = container.resolve(OnboardingView.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showProfileView() {
        let view = container.resolve(ProfileView.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showLoginView() {
        let view = container.resolve(LoginView.self)!
        view.delegate = self
        self.currentView = view
    }

}



extension AppCoordinator: FeedDelegate {
    
}

extension AppCoordinator: OnboardingViewDelegate {
    func nextPage() {
        //check user Login
        self.showLoginView()
        //self.showMainView()
    }
    
    
}

extension AppCoordinator: LoginViewDelegate {
    func openSignUp() {
        
    }
    
    func skipLogin() {
        self.showMainView()
    }
    
    func loginSuccess(){
        
    }
    
}

extension AppCoordinator: ProfileViewDelegate {
    
}


