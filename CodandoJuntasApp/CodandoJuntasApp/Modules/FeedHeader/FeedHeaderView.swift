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
    let eventsRepository: EventsRepository

    weak var delegate: FeedHeaderViewDelegate?

    init(eventsRepository: EventsRepository) {
        self.eventsRepository = eventsRepository
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
            eventsRepository: self.eventsRepository
        )
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        
        viewModel.eventList.drive(onNext: { [weak self] (events) in
            guard let self = self else {return}
            self.viewModel.events = events
            //self.tableView.reloadData()
        }).disposed(by: rx.disposeBag)

    }
}
