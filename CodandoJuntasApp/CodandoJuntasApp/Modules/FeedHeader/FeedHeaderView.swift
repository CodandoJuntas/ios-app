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

protocol FeedHeaderViewDelegate: class {
    
}

class FeedHeaderView: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleHeaderAtributedText: UILabel!
    
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
        collectionView.register(R.nib.eventCollectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupBindings() {
        
        viewModel.eventList.drive(onNext: { [weak self] (events) in
            guard let self = self else {return}
            self.viewModel.events = events
            self.collectionView.reloadData()
        }).disposed(by: rx.disposeBag)

    }
}

extension FeedHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.eventCollectionViewCell, for: indexPath) as! EventCollectionViewCell
        cell.setupCell(viewModel.events[indexPath.row])
        return cell
    }
    
    
    
}
