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
    func nextPage()
}

class OnboardingView: UIViewController {
    @IBOutlet weak var clouldTagView: CloudTagView!
    @IBOutlet weak var nextButton: UIButton!
    
    let tagList = ["Swift", "Java", "Cobol", "C++", "Python", "Javascript", "Processing", "Git", "HTML", "CSS", "Objective C", "Ruby", "Kotlin", "TypeScript", "Go", "Scala"]
    
    
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
        self.clouldTagView.items = tagList
    }
    
    func setupBindings() {
        
        self.nextButton.rx.tap.bind { [weak self] _ in
            self?.delegate?.nextPage()
            }.disposed(by: rx.disposeBag)

    }
}
