//
//  FeedHeaderView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 09/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(FeedHeaderView.self) { resolver in
        FeedHeaderView()
    }
 */

protocol FeedHeaderViewDelegate: class {
    
}

class FeedHeaderView: UIViewController {
    
    var viewModel: FeedHeaderViewModel!
    
    weak var delegate: FeedHeaderViewDelegate?

    init() {
        super.init(nibName: String(describing: FeedHeaderView.self), bundle: nil)
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

extension FeedHeaderView {
    
    func setupViewModel() {
        self.viewModel = FeedHeaderViewModel(
            input: ()
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
