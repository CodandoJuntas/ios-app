//
//  MainView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(MainView.self) { resolver in
        MainView()
    }
 */

protocol MainDelegate: class {
    
}

class MainView: UIViewController {
    
    var viewModel: MainViewModel!
    
    weak var delegate: MainDelegate?
    let localStorage: LocalStorage
    let repository: FeedRepository
    
    init(repository: FeedRepository, storage: LocalStorage) {
        self.repository = repository
        self.localStorage = storage
        super.init(nibName: String(describing: MainView.self), bundle: nil)
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

extension MainView {
    
    func setupViewModel() {
        self.viewModel = MainViewModel(feedRepository: self.repository, storage: self.localStorage)
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        viewModel.feed.drive(onNext: { (feed) in
            print("DONE!!!!")
        }).disposed(by: rx.disposeBag)
    }
}
