//
//  OnboardingView.swift
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
    self.register(OnboardingView.self) { resolver in
        OnboardingView()
    }
 */

protocol OnboardingViewDelegate: class {
    
}

class OnboardingView: UIViewController {
    
    var viewModel: OnboardingViewModel!
    
    weak var delegate: OnboardingViewDelegate?

    init() {
        super.init(nibName: String(describing: OnboardingView.self), bundle: nil)
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

extension OnboardingView {
    
    func setupViewModel() {
        self.viewModel = OnboardingViewModel()
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
