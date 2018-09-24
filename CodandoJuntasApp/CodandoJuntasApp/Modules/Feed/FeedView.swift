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

protocol FeedDelegate: class {
    
}

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    var feedTableViewDelegate: FeedTableViewDelegate!
    var feedTableViewDataSource: FeedTableViewDataSource!
    weak var delegate: FeedDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let localStorage: LocalStorage
    let repository: FeedRepository
    
    init(repository: FeedRepository, storage: LocalStorage) {
        self.repository = repository
        self.localStorage = storage
        super.init(nibName: String(describing: FeedView.self), bundle: nil)
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

extension FeedView {
    
    func setupViewModel() {
        self.viewModel = FeedViewModel(feedRepository: self.repository, storage: self.localStorage)
        self.feedTableViewDelegate = FeedTableViewDelegate(viewModel: self.viewModel)
        self.feedTableViewDataSource = FeedTableViewDataSource(viewModel: self.viewModel)
        self.tableView.dataSource = self.feedTableViewDataSource
        self.tableView.delegate = self.feedTableViewDelegate
    }
    
    func configureViews() {
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
        registerCells()
       
        
    }
    
    func setupBindings() {
        viewModel.feed.drive(onNext: { (feed) in
            
            self.tableView.reloadData()
        }).disposed(by: rx.disposeBag)
    }
    
}


extension FeedView {
    
    func registerCells(){
        tableView.register(R.nib.feedTableViewCell)
        tableView.register(R.nib.highlightedTableViewCell)
        tableView.register(R.nib.mostReadTableViewCell)
    }
}

