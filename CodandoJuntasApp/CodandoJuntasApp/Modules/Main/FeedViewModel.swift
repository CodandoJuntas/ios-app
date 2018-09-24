//
//  MainViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedViewModel {
    
    //let input: Driver<Void>
    let repository: FeedRepository
    let storage: LocalStorage
    
    let feed: Driver<Feed>
    
    init(feedRepository: FeedRepository, storage: LocalStorage) {
        self.repository = feedRepository
        self.storage = storage
        
        self.feed = repository.getFeed()
        .asDriver(onErrorJustReturn: Feed())
        
        
    }
}
