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

protocol FeedDelegate: class {
    func openProfile()
    func openContent(_ url: String)
    func openEvent()
}

class FeedView: UIViewController {
    
    var viewModel: FeedViewModel!
    var feedTableViewDelegate: FeedTableViewDelegate!
    var feedTableViewDataSource: FeedTableViewDataSource!
    weak var delegate: FeedDelegate?
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    let localStorage: LocalStorage
    let feedRepository: FeedRepository
    let feedHeaderView: FeedHeaderView
    
    init(feedRepository: FeedRepository, storage: LocalStorage, tableViewHeader: FeedHeaderView) {
        self.feedRepository = feedRepository
        self.localStorage = storage
        self.feedHeaderView = tableViewHeader
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
        self.viewModel = FeedViewModel(feedRepository: self.feedRepository)
        self.feedTableViewDelegate = FeedTableViewDelegate(viewModel: self.viewModel)
        self.feedTableViewDataSource = FeedTableViewDataSource(viewModel: self.viewModel)
        self.tableView.dataSource = self.feedTableViewDataSource
        self.tableView.delegate = self.feedTableViewDelegate
        self.tableView.contentInset.top = self.headerView.minHeight - 6
        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
    func configureViews() {
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.tableHeaderView = self.feedHeaderView.view
        self.feedHeaderView.delegate = self
        headerView.usernameLabel.attributedText = self.feedHeaderView.titleHeaderAtributedText.attributedText
        registerCells()
       
    }
    
    func setupBindings() {
        
        viewModel.feed.subscribe(onNext: { [weak self] (feed) in
            guard let self = self else {return}
            self.viewModel.mdFeed = feed
            self.tableView.reloadData()
        }).disposed(by: rx.disposeBag)
        
        viewModel.onRequestLink = {[weak self] target in
            self?.delegate?.openContent(target)
        }
        
        self.tableView.rx.contentOffset
            .map { $0.y }
            .map(currentScrollPercentage)
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: self.headerView.rx.fractionComplete)
            .disposed(by: rx.disposeBag)
    }
    
    func currentScrollPercentage(_ offset: CGFloat) -> CGFloat {
        return (offset + self.headerView.maxHeight) /
            (self.headerView.minHeight + self.headerView.maxHeight)
    }
   
}

extension FeedView {
    
    func registerCells(){
        tableView.register(R.nib.feedTableViewCell)
        tableView.register(R.nib.highlightedTableViewCell)
        tableView.register(R.nib.headerSectionView(), forHeaderFooterViewReuseIdentifier: "HeaderSectionView")

    }
}

extension FeedView: FeedHeaderViewDelegate {
    
    
    func openEventAtIndex(event: Event, index: IndexPath) {
        let frame = selectedFrame(index: index)
        let eventView = EventView(originFrame: frame, event: event)
        eventView.modalPresentationStyle = .overCurrentContext
        self.present(eventView, animated: false, completion: nil)
    }
    
    func selectedFrame(index: IndexPath) -> CGRect {
        let frame = self.feedHeaderView.collectionView.cellForItem(at: index)?.frame ?? CGRect.zero
        return self.view.convert(frame, from: self.feedHeaderView.collectionView)
    }
   
    
}

