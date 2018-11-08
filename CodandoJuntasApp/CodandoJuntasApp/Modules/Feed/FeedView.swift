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
    func openProfile()
}

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    var feedTableViewDelegate: FeedTableViewDelegate!
    var feedTableViewDataSource: FeedTableViewDataSource!
    weak var delegate: FeedDelegate?
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerButton: UIButton!
    
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
        headerView.addShadow(offSetX: 0, offSetY: 3, radius: 3, opacity: 0.3)
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
        registerCells()
       
        
    }
    
    func setupBindings() {
        
        viewModel.feed.subscribe(onNext: { [weak self] (feed) in
            guard let self = self else {return}
            self.viewModel.mdFeed = feed
            self.tableView.reloadData()
        }).disposed(by: rx.disposeBag)
        
        self.headerButton.rx.tap.bind { [weak self] _ in
            self?.delegate?.openProfile()
            }.disposed(by: rx.disposeBag)
    }
    
}


extension FeedView {
    
    func registerCells(){
        tableView.register(R.nib.feedTableViewCell)
        tableView.register(R.nib.highlightedTableViewCell)
        tableView.register(R.nib.mostReadTableViewCell)
        self.tableView.register(HeaderSectionView.self, forHeaderFooterViewReuseIdentifier: HeaderSectionView.reuseIdentifer)
        
    }
}

