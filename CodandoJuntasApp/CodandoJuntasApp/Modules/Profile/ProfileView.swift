//
//  ProfileView.swift
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
    self.register(ProfileView.self) { resolver in
        ProfileView()
    }
 */

protocol ProfileViewDelegate: class {
    func closeProfile()
    
}

class ProfileView: UIViewController {
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var cloudTagView: CloudTagView!
    var viewModel: ProfileViewModel!
    
    weak var delegate: ProfileViewDelegate?
    
    let tagList = ["Swift", "Processing", "Git", "Objective C", "PHP"]
    
    let localStorage: LocalStorage

    init(storage:LocalStorage) {
        self.localStorage = storage
        super.init(nibName: String(describing: ProfileView.self), bundle: nil)
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

extension ProfileView {
    
    func setupViewModel() {
        self.viewModel = ProfileViewModel()
    }
    
    func configureViews() {
        headerView.addShadow(offSetX: 0, offSetY: 3, radius: 3, opacity: 0.3)
        cloudTagView.items = self.tagList
    }
    
    func setupBindings() {
        
        self.closeButton.rx.tap.bind { [weak self] _ in
            self?.delegate?.closeProfile()
            }.disposed(by: rx.disposeBag)
    }
}
