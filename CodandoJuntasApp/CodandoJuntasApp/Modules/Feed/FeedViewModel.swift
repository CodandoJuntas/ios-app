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
    
    let repository: FeedRepository
    let storage: LocalStorage
    let feed: Observable<[MdFeed]>
    var mdFeed:[MdFeed] = []

    
    init(feedRepository: FeedRepository, storage: LocalStorage) {
        self.repository = feedRepository
        self.storage = storage
        
        self.feed = repository.getMdFeed()
        
    }
}
